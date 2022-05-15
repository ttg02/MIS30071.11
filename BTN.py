from tkinter import*
from tkinter import messagebox


class login:
    def __init__(self,root):
        self.root = root
        self.root.title('Buji')
        self.root.geometry('412x846')
        self.root.resizable(False,False)


        backg = Frame(self.root, bg='#99FFCC')
        backg.place(x=0,y=0, relwidth=1, relheight=1)
        # cửa sổ màu trắng
        Frame_Login = Frame(self.root, bg='white')
        Frame_Login.place(x=90, y= 130, width = 240, height= 300 )

        username = Label(Frame_Login, text= 'Nhập tên tài khoản', font =('Helvetica',12,'italic','bold'),fg='grey', bg='white').place(x=50, y= 30)
        self.username = Entry(Frame_Login, font=('Helvetica', 12),bg='#E7E6E6')
        self.username.place(x=45, y=60,width = 150, height= 30)

        password = Label(Frame_Login, text='Nhập mật khẩu', font=('Helvetica', 12, 'italic','bold'), fg='grey',bg='white').place(x=50, y=110)
        self.password = Entry(Frame_Login, font=('Helvetica', 12), bg='#E7E6E6')
        self.password.place(x=45, y=140, width=150, height=30)

        Login = Button(Frame_Login,command=self.check,cursor='hand2', text='Đăng nhập', font=('Helvetica', 12)).place(x=75, y=240,width = 100, height= 30)



    def check(self):
        if self.username.get()=='' or self.password.get()=='':
            messagebox.showerror('Không bỏ trống!','Mời nhập lại', parent = self.root)
        elif self.username.get()!='gialinh' or  self.password.get() != '12345!gl':
            messagebox.showerror('Không khớp','Mời nhập lại', parent=self.root)
        else:
             messagebox.showinfo('Chào mừng đến với Buji', 'Đăng nhập thành công!')


root =Tk()
obj = login(root)
root.mainloop()
