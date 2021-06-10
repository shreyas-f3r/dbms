"""
Widgets

search_lnedt
search_results_lstwd
total_movie_count_lbl
"""

import sys

from PyQt5 import QtWidgets as qtw
from PyQt5 import QtCore as qtc
from PyQt5 import QtGui as qtg


class MainWindow(qtw.QMainWindow):
    def __init__(self):
        super().__init__()
        
        #Variables
        
        #Init Methods
        self.setupUI()
        
        self.show()
        
    def setupUI(self):
        #Main Layout/Widget
        self.main_widget = qtw.QWidget()
        self.main_layout = qtw.QHBoxLayout()
        #Main Widget -> QMainWindow, Main Layout -> Main Widget
        self.setCentralWidget(self.main_widget)
        self.main_widget.setLayout(self.main_layout)
        #Secondary Layouts
        self.searches_left_layout = qtw.QVBoxLayout()
        self.right_layout = qtw.QVBoxLayout()
        #Secondary Widgets
        self.search_lnedt = qtw.QLineEdit()
        self.search_results_lstwd = qtw.QListWidget()
        self.total_movie_count_lbl = qtw.QLabel()
        #Configure Widgets
        self.search_lnedt.setPlaceholderText("Search By Name...")
        #Layouts -> Main Layout
        self.main_layout.addLayout(self.searches_left_layout)
        self.main_layout.addLayout(self.right_layout)
        #Widgets -> Layouts
        self.searches_left_layout.addWidget(self.search_lnedt)
        self.searches_left_layout.addWidget(self.search_results_lstwd)
        self.right_layout.addWidget(self.total_movie_count_lbl)
    
    def setupConnections(self):
        raise NotImplementedError
    
    #HELPER METHODS
    
    def get_searched_movie_name(self):
        if self.search_lnedt.text():
            return self.search_lnedt.text()
    
    def add_searched_movie_results(self, *results):
        self.search_results_lstwd.clear()
        self.search_results_lstwd.addItems(*results)
    
    def set_total_movie_count(self, count):
        if str(count).isdigit():
            self.total_movie_count_lbl.setText(str(count))
            
        
if __name__ == "__main__":
    app = qtw.QApplication(sys.argv)
    mw = MainWindow()
    sys.exit(app.exec())