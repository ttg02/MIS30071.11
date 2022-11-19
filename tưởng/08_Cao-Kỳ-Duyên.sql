--Câu 1. Viết hàm trả về TỔNG nợ mà khách CHƯA TRẢ nếu biết số điện thoại.
create function Tongno (@sdt varchar(15))
returns nvarchar(50)
as 
begin 
     declare @Tongno varchar(10) 
	 if @sdt in (select SoDT from Khach)
	    set @Tongno = (select SoTien from CongNo where SoDT = @sdt and TrangThai='0')
	 else 
	    set @Tongno = N'Số điện thoại không hợp lệ'
	return @Tongno
end

print N'Tổng nợ mà khách chưa trả là: ' + dbo.Tongno('0905112324')

select * from Khach
go
--Câu 2. Tạo thủ tục cập nhật tổng tiền của DonBan nếu biết mã đơn bán, biết rằng: Tổng tiền = SUM(ThanhTien) của đơn hàng có cùng mã đơn bán.
create proc spTongtien @madonban int, @tongtien varchar(15) out
as
begin
     if @madonban in (select MaDonBan from DonBan)
	   set @tongtien = (select sum(ThanhTien) from DonBanChiTiet where MaDonBan = @madonban)
     else 
	     print N'Mã đơn bán không hợp lệ'
end

declare @a varchar(10)
exec spTongtien '1', @a out
print @a

select * from DonBan
--Câu 3. Khi sửa dữ liệu của bảng Hang, hãy đảm bảo rằng GiaNhap luôn nhỏ hơn hoặc bằng GiaBan.
alter trigger trigc3
on Hang
after insert, update, delete
as
begin 
     declare @mahang int, @tenhang nvarchar(100), @gianhap numeric(12,0), @giaban numeric(12,0), @donvitinh nvarchar(50),
	         @soluongton int, @khuyenmai float, @maloai int
	select @gianhap = GiaNhap, @giaban = GiaBan from inserted
	if @gianhap > @giaban
	begin 
	     print N'Không hợp lệ'
		 rollback
    end
	
end

update Hang set GiaNhap = '8500', GiaBan = '7500' where MaHang = '3'

select * from Hang