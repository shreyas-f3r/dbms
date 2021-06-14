import sqlite3                    #importing module for performing SQL operations.
from tkinter import *             #importing module for creating GUI
from tkinter import messagebox


class DB:                         #creating a class DB with functions to perform various operations on the database. 
    def __init__(self):           #constructor functor for class DB.
        self.conn = sqlite3.connect("movies.db")  #connects to a database called movies.db
        self.cur = self.conn.cursor()    #creating a cursor to navigate through the database
        self.cur.execute(             
            "CREATE TABLE IF NOT EXISTS movie (id INTEGER PRIMARY KEY, movie TEXT, year TEXT, rating TEXT)") #creating a table called book with id, movie, year and rating as columns.
        self.conn.commit()  #commit functions saves everything to the database

    def __del__(self):          #destructor created for the class DB
        self.conn.close()   #closes the connection with the database

    def view(self):         #To view all the rows present in the table
        self.cur.execute("SELECT * FROM movie") #Execute function is to perform the SQL operations. Here, it produces all the rows from the table.
        rows = self.cur.fetchall()  #fetching all the rows one by one from the table and storing it in list rows
        return rows

    def insert(self, movie, year, rating):  #inserting a new row in the table. 
        self.cur.execute("INSERT INTO movie VALUES (NULL,?,?,?)", (movie, year, rating,)) #passing values to the function to store them in the columns
        self.conn.commit()
        self.view()

    def update(self, id, movie, year,rating):    #to update the values of the selected row with the values passed by the user
        self.cur.execute("UPDATE movie SET movie=?, year=?, rating=? WHERE id=?", (movie, year, rating, id,))
        self.conn.commit()
        self.view()

    def delete(self, id):                   #to delete the row from the table given the value of the id of the selected row.
        self.cur.execute("DELETE FROM movie WHERE id=?", (id,))
        self.conn.commit()
        self.view()

    def search(self, movie="", year="",rating=""):  #to search for a given entry in the table given either the value of the movie or year or ratings
        self.cur.execute("SELECT * FROM movie WHERE movie=? OR year=? OR rating=?", (movie, year, rating))
        rows = self.cur.fetchall()
        return rows


db = DB()  #created an object of the class DB. Now database is connected and a new table movies has been formed.


def get_selected_row(event): #selecting a particular row or multiple rows
    global selected_tuple
    index = list1.curselection()[0] #this is the id of the selected tuple
    selected_tuple = list1.get(index) 
    e1.delete(0, END)                 #deleting the value so that can be used again for next movie
    e1.insert(END, selected_tuple[1]) #inserting the title of the movie
    e2.delete(0, END)
    e2.insert(END, selected_tuple[2]) #inserting year
    e3.delete(0, END)
    e3.insert(END, selected_tuple[3]) #inserting rating


def view_command():         #to print all the rows of the table using view function of the class DB on to the screen 
    list1.delete(0, END)    #empty the list
    for row in db.view():   #loop until we reach the end of the table movie
        list1.insert(END, row)  #keeps on inserting each row into the list


def search_command():       #to print the row we want based on movie or year or rating
    list1.delete(0, END)    #empty the list
    for row in db.search(movie_text.get(), year_text.get(), rating_text.get()): #get the name of the movie or the year or rating and pass it to the search function of class DB
        list1.insert(END, row) #will insert all the rows having the same value of movie or year or rating


def add_command():          #to add a new row into the table
    db.insert(movie_text.get(), year_text.get(), rating_text.get()) #passing user input values 
    list1.delete(0, END) #empty the list
    list1.insert(END, (movie_text.get(), year_text.get(), rating_text.get()))  #insert into the list and then the table, the values given by the user


def delete_command(): #deleting a row 
    db.delete(selected_tuple[0]) #calls the delete function of the class DB and passes the id as the parameter and condition


def update_command():
    db.update(selected_tuple[0], movie_text.get(), year_text.get(),rating_text.get()) #calls the update function of the class DB and passes the user input as parameters to update value of the row


window = Tk() #using Tkinter module, create a GUI window

window.title("Movies and Series") #setting title of the window


def on_closing(): #destructor for the window
    dd = db
    if messagebox.askokcancel("Quit", "Do you want to quit?"): #when ok is clicked, displays the following message
        window.destroy()
        del dd #deletes the object once window has been closed


window.protocol("WM_DELETE_WINDOW", on_closing)  # handles window closing

l1 = Label(window, text="Movie") #creating input labels in the window
l1.grid(row=0, column=0) #determining size of the input grid for these labels

l2 = Label(window, text="Year")
l2.grid(row=0, column=2)

l3 = Label(window, text="Rating")
l3.grid(row=1, column=0)

movie_text = StringVar()
e1 = Entry(window, textvariable=movie_text) #taking input from the user in the grid and storing it in a string variable
e1.grid(row=0, column=1)

year_text = StringVar() #taking year name input
e2 = Entry(window, textvariable=year_text)
e2.grid(row=0, column=3)

rating_text = StringVar() #taking rating input
e3 = Entry(window, textvariable=rating_text)
e3.grid(row=1, column=1)

list1 = Listbox(window, height=25, width=65) #creating the list space to display all the rows of the table
list1.grid(row=2, column=0, rowspan=6, columnspan=2) #determining the size

sb1 = Scrollbar(window) #creating a scrollbar for the window to scroll through the list entries
sb1.grid(row=2, column=2, rowspan=6)

list1.configure(yscrollcommand=sb1.set) #configuring the scroll function for the scrollbar object sb1
sb1.configure(command=list1.yview)

list1.bind('<<ListboxSelect>>', get_selected_row)

b1 = Button(window, text="View all", width=12, command=view_command) #creating buttons for the various operations. Giving it a name and assigning a particular command to it. 
b1.grid(row=2, column=3) #size of the button

b2 = Button(window, text="Search entry", width=12, command=search_command)
b2.grid(row=3, column=3)

b3 = Button(window, text="Add entry", width=12, command=add_command)
b3.grid(row=4, column=3)

b4 = Button(window, text="Update selected", width=12, command=update_command)
b4.grid(row=5, column=3)

b5 = Button(window, text="Delete selected", width=12, command=delete_command)
b5.grid(row=6, column=3)

b6 = Button(window, text="Close", width=12, command=window.destroy)
b6.grid(row=7, column=3)


window.mainloop() #carry the functioning of the GUI window on a loop until it is closed using the destructor
