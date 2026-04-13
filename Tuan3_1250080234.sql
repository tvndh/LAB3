SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Xin chao! Ban dang dang nhap voi user la: ' || USER);
END;
/
-- 1. B?ng Mon_hoc 
CREATE TABLE MON_HOC (
    MaMonHoc        NUMBER(8, 0) NOT NULL,
    TenMonHoc       VARCHAR2(50),
    HocPhi          NUMBER(9, 2),
    MaMonTienQuyet  NUMBER(8, 0),
    NguoiTao        VARCHAR2(30) NOT NULL,
    NgayTao         DATE NOT NULL,
    NguoiSua        VARCHAR2(30) NOT NULL,
    NgaySua         DATE NOT NULL,
    
    CONSTRAINT PK_MON_HOC PRIMARY KEY (MaMonHoc),
    CONSTRAINT FK_MH_TIEN_QUYET FOREIGN KEY (MaMonTienQuyet) REFERENCES MON_HOC(MaMonHoc)
);

-- 2. B?ng Giao_vien 
CREATE TABLE GIAO_VIEN (
    MaGiaoVien      NUMBER(8) NOT NULL,
    DanhHieu        VARCHAR2(5),
    Ten             VARCHAR2(25),
    Ho              VARCHAR2(25),
    DiaChi          VARCHAR2(50),
    SoDienThoai     VARCHAR2(15),
    NguoiTao        VARCHAR2(30) NOT NULL,
    NgayTao         DATE NOT NULL,
    NguoiSua        VARCHAR2(30) NOT NULL,
    NgaySua         DATE NOT NULL,
    
    CONSTRAINT PK_GIAO_VIEN PRIMARY KEY (MaGiaoVien)
);

-- 3. B?ng Sinh_vien 
CREATE TABLE SINH_VIEN (
    MaSinhVien      NUMBER(8, 0) NOT NULL,
    DanhHieu        VARCHAR2(5),
    Ten             VARCHAR2(25),
    Ho              VARCHAR2(25) NOT NULL,
    DiaChi          VARCHAR2(50),
    SoDienThoai     VARCHAR2(15),
    TenCongTy       VARCHAR2(50),
    NgayDangKy      DATE NOT NULL,
    NguoiTao        VARCHAR2(30) NOT NULL,
    NgayTao         DATE NOT NULL,
    NguoiSua        VARCHAR2(30) NOT NULL,
    NgaySua         DATE NOT NULL,
    
    CONSTRAINT PK_SINH_VIEN PRIMARY KEY (MaSinhVien)
);

-- 4. B?ng Lop_hoc 
CREATE TABLE LOP_HOC (
    MaLopHoc        NUMBER(8, 0) NOT NULL,
    MaMonHoc        NUMBER(8, 0) NOT NULL,
    SoLop           NUMBER(3) NOT NULL,
    ThoiGianBatDau  DATE,
    PhongHoc        VARCHAR2(50),
    MaGiaoVien      NUMBER(8, 0) NOT NULL,
    SoLuongToiDa    NUMBER(3, 0),
    NguoiTao        VARCHAR2(30) NOT NULL,
    NgayTao         DATE NOT NULL,
    NguoiSua        VARCHAR2(30) NOT NULL,
    NgaySua         DATE NOT NULL,
    
    CONSTRAINT PK_LOP_HOC PRIMARY KEY (MaLopHoc),
    CONSTRAINT FK_LOP_HOC_MON_HOC FOREIGN KEY (MaMonHoc) REFERENCES MON_HOC(MaMonHoc),
    CONSTRAINT FK_LH_GIAO_VIEN FOREIGN KEY (MaGiaoVien) REFERENCES GIAO_VIEN(MaGiaoVien)
);

-- 5. B?ng Dang_ky 
CREATE TABLE DANG_KY (
    MaSinhVien      NUMBER(8, 0) NOT NULL,
    MaLopHoc        NUMBER(8, 0) NOT NULL,
    NgayGhiDanh     DATE NOT NULL,
    DiemTongKet     NUMBER(3, 0),
    NgayDangKy      DATE NOT NULL,
    NguoiTao        VARCHAR2(30) NOT NULL,
    NgayTao         DATE NOT NULL,
    NguoiSua        VARCHAR2(30) NOT NULL,
    NgaySua         DATE NOT NULL,
    
    CONSTRAINT PK_DANG_KY PRIMARY KEY (MaSinhVien, MaLopHoc),
    CONSTRAINT FK_DK_SINH_VIEN FOREIGN KEY (MaSinhVien) REFERENCES SINH_VIEN(MaSinhVien),
    CONSTRAINT FK_DK_LOP_HOC FOREIGN KEY (MaLopHoc) REFERENCES LOP_HOC(MaLopHoc)
);

-- 6. B?ng Diem 
CREATE TABLE DIEM (
    MaSinhVien      NUMBER(8) NOT NULL,
    MaLopHoc        NUMBER(8) NOT NULL,
    DiemSo          NUMBER(3) NOT NULL,
    LoiPhe          VARCHAR2(2000),
    NguoiTao        VARCHAR2(30) NOT NULL,
    NgayTao         DATE NOT NULL,
    NguoiSua        VARCHAR2(30) NOT NULL,
    NgaySua         DATE NOT NULL,
    
    CONSTRAINT FK_DIEM_DANG_KY FOREIGN KEY (MaSinhVien, MaLopHoc) REFERENCES DANG_KY(MaSinhVien, MaLopHoc)
);
-- d? li?u b?ng giao_vien
INSERT INTO GIAO_VIEN VALUES (101, 'ThS.', 'Tuan', 'Nguyen Anh', 'Quan 1, TP.HCM', '0901234567', 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO GIAO_VIEN VALUES (102, 'TS.', 'Huong', 'Tran Thi', 'Quan 3, TP.HCM', '0912345678', 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO GIAO_VIEN VALUES (103, 'PGS.', 'Nam', 'Le Hoang', 'Phu Nhuan, TP.HCM', '0923456789', 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO GIAO_VIEN VALUES (104, 'ThS.', 'Linh', 'Pham Thuy', 'Go Vap, TP.HCM', '0934567890', 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO GIAO_VIEN VALUES (105, 'TS.', 'Cuong', 'Vu Quoc', 'Tan Binh, TP.HCM', '0945678901', 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO GIAO_VIEN VALUES (106, 'ThS.', 'Mai', 'Bui Thi', 'Thu Duc, TP.HCM', '0956789012', 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO GIAO_VIEN VALUES (107, 'ThS.', 'Long', 'Do Hai', 'Quan 7, TP.HCM', '0967890123', 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO GIAO_VIEN VALUES (108, 'TS.', 'Anh', 'Hoang Tuan', 'Quan 10, TP.HCM', '0978901234', 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO GIAO_VIEN VALUES (109, 'GS.', 'Lan', 'Ngo Ngoc', 'Binh Thanh, TP.HCM', '0989012345', 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO GIAO_VIEN VALUES (110, 'ThS.', 'Phong', 'Trinh Van', 'Quan 12, TP.HCM', '0990123456', 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
-- d? li?u b?ng sinh_vien
INSERT INTO SINH_VIEN VALUES (1001, 'Mr.', 'Kien', 'Tran Trung', 'Ha Noi', '0321111111', 'FPT Software', TO_DATE('01/08/2023', 'DD/MM/YYYY'), 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO SINH_VIEN VALUES (1002, 'Ms.', 'Hoa', 'Nguyen Mai', 'Da Nang', '0322222222', 'Viettel', TO_DATE('02/08/2023', 'DD/MM/YYYY'), 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO SINH_VIEN VALUES (1003, 'Mr.', 'Hung', 'Le Van', 'Hai Phong', '0323333333', NULL, TO_DATE('05/08/2023', 'DD/MM/YYYY'), 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO SINH_VIEN VALUES (1004, 'Ms.', 'Thao', 'Phan Thi', 'Can Tho', '0324444444', 'VNG', TO_DATE('10/08/2023', 'DD/MM/YYYY'), 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO SINH_VIEN VALUES (1005, 'Mr.', 'Binh', 'Vo Thanh', 'TP.HCM', '0325555555', 'Tiki', TO_DATE('12/08/2023', 'DD/MM/YYYY'), 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO SINH_VIEN VALUES (1006, 'Mr.', 'Hieu', 'Dang Trong', 'Binh Duong', '0326666666', NULL, TO_DATE('15/08/2023', 'DD/MM/YYYY'), 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO SINH_VIEN VALUES (1007, 'Ms.', 'Yen', 'Hoang Hai', 'Dong Nai', '0327777777', 'Momo', TO_DATE('20/08/2023', 'DD/MM/YYYY'), 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO SINH_VIEN VALUES (1008, 'Mr.', 'Quan', 'Bui Anh', 'Vung Tau', '0328888888', NULL, TO_DATE('22/08/2023', 'DD/MM/YYYY'), 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO SINH_VIEN VALUES (1009, 'Ms.', 'Nhung', 'Doan Thi', 'Hue', '0329999999', 'Shopee', TO_DATE('25/08/2023', 'DD/MM/YYYY'), 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO SINH_VIEN VALUES (1010, 'Mr.', 'Son', 'Ngo Thai', 'Nha Trang', '0320000000', NULL, TO_DATE('28/08/2023', 'DD/MM/YYYY'), 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
-- d? li?u b?ng mon_hoc
-- Thêm các môn cõ s? (Không có môn tiên quy?t)
INSERT INTO MON_HOC VALUES (1, 'Nhap mon Lap trinh', 1500000, NULL, 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO MON_HOC VALUES (2, 'Co so du lieu', 1800000, NULL, 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO MON_HOC VALUES (3, 'Mang may tinh', 1600000, NULL, 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO MON_HOC VALUES (4, 'Toan roi rac', 1200000, NULL, 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);

-- Thêm các môn nâng cao (C?n h?c môn cõ s? trý?c)
INSERT INTO MON_HOC VALUES (5, 'Cau truc du lieu', 2000000, 1, 'ADMIN', SYSDATE, 'ADMIN', SYSDATE); -- Tiên quy?t là môn 1
INSERT INTO MON_HOC VALUES (6, 'Lap trinh Web', 2500000, 1, 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);      -- Tiên quy?t là môn 1
INSERT INTO MON_HOC VALUES (7, 'Lap trinh Java', 2500000, 1, 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);     -- Tiên quy?t là môn 1
INSERT INTO MON_HOC VALUES (8, 'He quan tri CSDL', 2200000, 2, 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);   -- Tiên quy?t là môn 2
INSERT INTO MON_HOC VALUES (9, 'An toan thong tin', 2000000, 3, 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);  -- Tiên quy?t là môn 3
INSERT INTO MON_HOC VALUES (10, 'Tri tue nhan tao', 3000000, 5, 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);  -- Tiên quy?t là môn 5
--d? li?u b?ng lop_hoc
INSERT INTO LOP_HOC VALUES (501, 1, 1, TO_DATE('01/09/2023', 'DD/MM/YYYY'), 'Phong A101', 101, 40, 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO LOP_HOC VALUES (502, 1, 2, TO_DATE('01/09/2023', 'DD/MM/YYYY'), 'Phong A102', 102, 40, 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO LOP_HOC VALUES (503, 2, 1, TO_DATE('05/09/2023', 'DD/MM/YYYY'), 'Phong B201', 103, 35, 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO LOP_HOC VALUES (504, 3, 1, TO_DATE('10/09/2023', 'DD/MM/YYYY'), 'Phong C301', 104, 50, 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO LOP_HOC VALUES (505, 5, 1, TO_DATE('15/09/2023', 'DD/MM/YYYY'), 'Phong Lab 1', 105, 30, 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO LOP_HOC VALUES (506, 6, 1, TO_DATE('20/09/2023', 'DD/MM/YYYY'), 'Phong Lab 2', 106, 30, 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO LOP_HOC VALUES (507, 7, 1, TO_DATE('01/10/2023', 'DD/MM/YYYY'), 'Phong Lab 3', 107, 30, 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO LOP_HOC VALUES (508, 8, 1, TO_DATE('05/10/2023', 'DD/MM/YYYY'), 'Phong B202', 108, 35, 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO LOP_HOC VALUES (509, 9, 1, TO_DATE('10/10/2023', 'DD/MM/YYYY'), 'Phong C302', 109, 45, 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO LOP_HOC VALUES (510, 10, 1, TO_DATE('15/10/2023', 'DD/MM/YYYY'), 'Phong D401', 110, 25, 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
--d? li?u b?ng dang_ky
INSERT INTO DANG_KY VALUES (1001, 501, TO_DATE('25/08/2023', 'DD/MM/YYYY'), NULL, TO_DATE('25/08/2023', 'DD/MM/YYYY'), 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO DANG_KY VALUES (1002, 501, TO_DATE('26/08/2023', 'DD/MM/YYYY'), NULL, TO_DATE('26/08/2023', 'DD/MM/YYYY'), 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO DANG_KY VALUES (1003, 502, TO_DATE('26/08/2023', 'DD/MM/YYYY'), NULL, TO_DATE('26/08/2023', 'DD/MM/YYYY'), 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO DANG_KY VALUES (1004, 503, TO_DATE('27/08/2023', 'DD/MM/YYYY'), NULL, TO_DATE('27/08/2023', 'DD/MM/YYYY'), 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO DANG_KY VALUES (1005, 504, TO_DATE('28/08/2023', 'DD/MM/YYYY'), NULL, TO_DATE('28/08/2023', 'DD/MM/YYYY'), 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO DANG_KY VALUES (1006, 505, TO_DATE('01/09/2023', 'DD/MM/YYYY'), NULL, TO_DATE('01/09/2023', 'DD/MM/YYYY'), 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO DANG_KY VALUES (1007, 506, TO_DATE('02/09/2023', 'DD/MM/YYYY'), NULL, TO_DATE('02/09/2023', 'DD/MM/YYYY'), 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO DANG_KY VALUES (1008, 507, TO_DATE('05/09/2023', 'DD/MM/YYYY'), NULL, TO_DATE('05/09/2023', 'DD/MM/YYYY'), 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO DANG_KY VALUES (1009, 508, TO_DATE('10/09/2023', 'DD/MM/YYYY'), NULL, TO_DATE('10/09/2023', 'DD/MM/YYYY'), 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO DANG_KY VALUES (1010, 510, TO_DATE('12/09/2023', 'DD/MM/YYYY'), NULL, TO_DATE('12/09/2023', 'DD/MM/YYYY'), 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
--d? li?u b?ng diem
INSERT INTO DIEM VALUES (1001, 501, 85, 'Hoc vien cham chi', 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO DIEM VALUES (1002, 501, 90, 'Tu duy tot', 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO DIEM VALUES (1003, 502, 75, 'Can co gang them phan thuc hanh', 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO DIEM VALUES (1004, 503, 88, 'Kien thuc CSDL tot', 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO DIEM VALUES (1005, 504, 65, 'Chua nam vung kien thuc mang', 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO DIEM VALUES (1006, 505, 95, 'Thuc hanh lap trinh xuat sac', 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO DIEM VALUES (1007, 506, 80, 'Nam bat Framework tot', 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO DIEM VALUES (1008, 507, 70, 'Bai tap nhom hoi yeu', 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO DIEM VALUES (1009, 508, 92, 'Hieu ro he quan tri', 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO DIEM VALUES (1010, 510, 89, 'Co to chat hoc AI', 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);

COMMIT;
--Bai 1
-- Cau 1a
CREATE TABLE Cau1 (
ID NUMBER,
NAME VARCHAR2(20)
);
-- Cau 1b
CREATE SEQUENCE Cau1Seq
START WITH 5
INCREMENT BY 5;
-- Câu 1c–1j: Toàn b? chýõng tr?nh: bi?n, INSERT nhi?u bý?c, Savepoint, Rollback
SET SERVEROUTPUT ON;

DECLARE
    v_name VARCHAR2(100);
    v_id NUMBER;
BEGIN
    -- [d] Them sinh vien dang ki nhieu mon nhat
    SELECT Ho || ' ' || Ten
    INTO v_name
    FROM SINH_VIEN
    WHERE MaSinhVien = (
        SELECT MaSinhVien FROM (
            SELECT MaSinhVien FROM DANG_KY
            GROUP BY MaSinhVien
            HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM DANG_KY GROUP BY MaSinhVien)
        ) WHERE ROWNUM = 1
    );

    INSERT INTO Cau1 (ID, NAME)
    VALUES (Cau1Seq.NEXTVAL, v_name);
    SAVEPOINT sp_a; -- Savepoint A

    -- [e] Them sinh vien dang ki it mon nhat
    SELECT Ho || ' ' || Ten
    INTO v_name
    FROM SINH_VIEN
    WHERE MaSinhVien = (
        SELECT MaSinhVien FROM (
            SELECT MaSinhVien FROM DANG_KY
            GROUP BY MaSinhVien
            HAVING COUNT(*) = (SELECT MIN(COUNT(*)) FROM DANG_KY GROUP BY MaSinhVien)
        ) WHERE ROWNUM = 1
    );

    INSERT INTO Cau1 (ID, NAME)
    VALUES (Cau1Seq.NEXTVAL, v_name);
    SAVEPOINT sp_b; -- Savepoint B

    -- [f] Them giao vien day nhieu lop nhat
    SELECT Ho || ' ' || Ten
    INTO v_name
    FROM GIAO_VIEN
    WHERE MaGiaoVien = (
        SELECT MaGiaoVien FROM (
            SELECT MaGiaoVien FROM LOP_HOC
            GROUP BY MaGiaoVien
            HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM LOP_HOC GROUP BY MaGiaoVien)
        ) WHERE ROWNUM = 1
    );

    INSERT INTO Cau1 (ID, NAME)
    VALUES (Cau1Seq.NEXTVAL, v_name);
    SAVEPOINT sp_c; -- Savepoint C

    -- [g] SELECT INTO: lay ID cua giao vien vua them vao bien v_id
    SELECT ID INTO v_id
    FROM Cau1
    WHERE NAME = v_name;

    DBMS_OUTPUT.PUT_LINE('ID giao vien nhieu lop: ' || v_id);

    -- [h] Rollback giao vien nhieu lop (ve Savepoint B)
    ROLLBACK TO sp_b;

    -- [i] Them giao vien it lop nhat, dung v_id da luu
    SELECT Ho || ' ' || Ten
    INTO v_name
    FROM GIAO_VIEN
    WHERE MaGiaoVien = (
        SELECT MaGiaoVien FROM (
            SELECT MaGiaoVien FROM LOP_HOC
            GROUP BY MaGiaoVien
            HAVING COUNT(*) = (SELECT MIN(COUNT(*)) FROM LOP_HOC GROUP BY MaGiaoVien)
        ) WHERE ROWNUM = 1
    );

    INSERT INTO Cau1 (ID, NAME)
    VALUES (v_id, v_name); -- Dung v_id (khong phai sequence)

    -- [j] Them lai giao vien nhieu lop, dung sequence
    SELECT Ho || ' ' || Ten
    INTO v_name
    FROM GIAO_VIEN
    WHERE MaGiaoVien = (
        SELECT MaGiaoVien FROM (
            SELECT MaGiaoVien FROM LOP_HOC
            GROUP BY MaGiaoVien
            HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM LOP_HOC GROUP BY MaGiaoVien)
        ) WHERE ROWNUM = 1
    );

    INSERT INTO Cau1 (ID, NAME)
    VALUES (Cau1Seq.NEXTVAL, v_name); -- Dung sequence

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Hoan tat! Kiem tra: SELECT * FROM Cau1;');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Loi: Khong tim thay du lieu! Co the do bang chua co du lieu.');
        ROLLBACK;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Loi: ' || SQLERRM);
        ROLLBACK;
END;
/
--Câu 2
SET SERVEROUTPUT ON;

DECLARE
    -- S? d?ng bi?n thay th? (&) ð? yêu c?u ngý?i dùng nh?p li?u khi ch?y
    v_sid   NUMBER       := &ma_sinh_vien;
    v_ho    VARCHAR2(25) := '&ho_sinh_vien';
    v_ten   VARCHAR2(25) := '&ten_sinh_vien';
    v_addr  VARCHAR2(50) := '&dia_chi';
    
    v_found VARCHAR2(55);
    v_classes NUMBER;
BEGIN
    -- Th? t?m sinh viên theo m? v?a nh?p
    SELECT Ho || ' ' || Ten
    INTO v_found
    FROM SINH_VIEN
    WHERE MaSinhVien = v_sid;

    -- N?u t?m th?y (không b? vãng l?i NO_DATA_FOUND): Ð?m s? l?p ðang h?c
    SELECT COUNT(*)
    INTO v_classes
    FROM DANG_KY
    WHERE MaSinhVien = v_sid;

    DBMS_OUTPUT.PUT_LINE('-----------------------------------');
    DBMS_OUTPUT.PUT_LINE('Ho ten sinh vien: ' || v_found);
    DBMS_OUTPUT.PUT_LINE('So lop dang hoc: ' || v_classes);
    DBMS_OUTPUT.PUT_LINE('-----------------------------------');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Sinh viên chýa t?n t?i: ti?n hành thêm m?i
        DBMS_OUTPUT.PUT_LINE('Sinh vien mang ma ' || v_sid || ' chua ton tai. Dang them moi...');
        
        INSERT INTO SINH_VIEN (
            MaSinhVien, Ho, Ten, DiaChi, 
            NgayDangKy, NguoiTao, NgayTao, NguoiSua, NgaySua
        )
        VALUES (
            v_sid, v_ho, v_ten, v_addr, 
            SYSDATE, USER, SYSDATE, USER, SYSDATE
        );
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Da them sinh vien moi thanh cong: ' || v_ho || ' ' || v_ten);
        
    WHEN OTHERS THEN
        -- B?t các l?i b?t ng? khác ð? tránh treo h? th?ng
        DBMS_OUTPUT.PUT_LINE('Loi he thong: ' || SQLERRM);
        ROLLBACK;
END;
/
-- Bài 2
-- Câu 1
SET SERVEROUTPUT ON;

DECLARE
    v_instructor_id NUMBER := &ma_giao_vien;
    v_ho            VARCHAR2(25);
    v_ten           VARCHAR2(25);
    v_so_lop        NUMBER;
BEGIN
    -- 1. Thu tim giao vien 
    SELECT Ho, Ten
    INTO v_ho, v_ten
    FROM GIAO_VIEN
    WHERE MaGiaoVien = v_instructor_id;

    -- 2. Neu giao vien ton tai, tien hanh dem so lop
    SELECT COUNT(*)
    INTO v_so_lop
    FROM LOP_HOC
    WHERE MaGiaoVien = v_instructor_id;

    -- In ten giao vien ra cho dep
    DBMS_OUTPUT.PUT_LINE('-----------------------------------');
    DBMS_OUTPUT.PUT_LINE('Giang vien: ' || v_ho || ' ' || v_ten);

    -- 3. Phan nhanh theo ket qua dem duoc
    IF v_so_lop >= 5 THEN
        DBMS_OUTPUT.PUT_LINE('Dang day ' || v_so_lop || ' lop -> Giao vien nay nen nghi ngoi!');
    ELSIF v_so_lop = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Hien tai giao vien chua duoc phan cong day lop nao.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('So lop giao vien dang day: ' || v_so_lop);
    END IF;
    DBMS_OUTPUT.PUT_LINE('-----------------------------------');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Khong tim thay giao vien nao co ma: ' || v_instructor_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Loi he thong: ' || SQLERRM);
END;
/
-- câu 2
SET SERVEROUTPUT ON;

DECLARE
    v_sid    NUMBER := &ma_sinh_vien;
    v_cid    NUMBER := &ma_lop;
    v_score  NUMBER;
    v_grade  VARCHAR2(2);
    v_check  NUMBER;
BEGIN
    -- 1. Kiem tra sinh vien ton tai
    SELECT COUNT(*) INTO v_check
    FROM SINH_VIEN WHERE MaSinhVien = v_sid;
    
    IF v_check = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Loi: Ma sinh vien ' || v_sid || ' khong ton tai!');
        RETURN; 
    END IF;

    -- 2. Kiem tra lop ton tai
    SELECT COUNT(*) INTO v_check
    FROM LOP_HOC WHERE MaLopHoc = v_cid;
    
    IF v_check = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Loi: Ma lop ' || v_cid || ' khong ton tai!');
        RETURN;
    END IF;

    -- 3. Lay diem cua sinh vien trong lop
    SELECT DiemTongKet
    INTO v_score
    FROM DANG_KY
    WHERE MaSinhVien = v_sid AND MaLopHoc = v_cid;

    -- 4. Xu ly logic: Neu chua co diem (NULL)
    IF v_score IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('Sinh vien ' || v_sid || ' da dang ky lop ' || v_cid || ' nhung hien tai CHUA CO DIEM.');
        RETURN;
    END IF;

    -- 5. Quy doi diem so sang diem chu bang CASE
    CASE
        WHEN v_score >= 90 THEN v_grade := 'A';
        WHEN v_score >= 80 THEN v_grade := 'B';
        WHEN v_score >= 70 THEN v_grade := 'C';
        WHEN v_score >= 50 THEN v_grade := 'D';
        ELSE v_grade := 'F';
    END CASE;

    -- In ket qua
    DBMS_OUTPUT.PUT_LINE('-----------------------------------');
    DBMS_OUTPUT.PUT_LINE('Diem so: ' || v_score || ' -> Diem chu: ' || v_grade);
    DBMS_OUTPUT.PUT_LINE('-----------------------------------');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Loi: Sinh vien ' || v_sid || ' chua dang ky (hoac khong co ten) trong lop ' || v_cid || '!');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Loi he thong: ' || SQLERRM);
END;
/
-- bài 3
SET SERVEROUTPUT ON;

DECLARE
    -- Cursor 1: Duyet tung mon hoc
    CURSOR cur_course IS
        SELECT MaMonHoc, TenMonHoc
        FROM MON_HOC
        ORDER BY MaMonHoc;

    -- Cursor 2: Lay lop hoc cua mot mon (co doi so)
    CURSOR cur_class (p_mamonhoc NUMBER) IS
        SELECT c.SoLop,
               COUNT(e.MaSinhVien) AS so_sv
        FROM LOP_HOC c
        LEFT JOIN DANG_KY e ON c.MaLopHoc = e.MaLopHoc
        WHERE c.MaMonHoc = p_mamonhoc
        GROUP BY c.SoLop
        ORDER BY c.SoLop;

    -- Khai bao bien kieu %TYPE (Lay dung kieu du lieu cua cot)
    v_courseno MON_HOC.MaMonHoc%TYPE;
    v_desc     MON_HOC.TenMonHoc%TYPE;
    v_classno  LOP_HOC.SoLop%TYPE;
    v_count    NUMBER;
BEGIN
    -- Duyet cursor ngoai: tung mon hoc
    OPEN cur_course;
    LOOP
        FETCH cur_course INTO v_courseno, v_desc;
        EXIT WHEN cur_course%NOTFOUND;

        -- In ten mon hoc
        DBMS_OUTPUT.PUT_LINE('------------------------------------------------');
        DBMS_OUTPUT.PUT_LINE('Mon hoc: ' || v_courseno || ' - ' || v_desc);

        -- Mo cursor trong voi doi so la ma mon hoc hien tai
        OPEN cur_class(v_courseno);
        LOOP
            FETCH cur_class INTO v_classno, v_count;
            EXIT WHEN cur_class%NOTFOUND;

            -- In thong tin lop hoc (Thut le vao cho de doc)
            DBMS_OUTPUT.PUT_LINE('   -> Lop: ' || v_classno || ' co so luong sinh vien dang ki: ' || v_count);
        END LOOP;
        CLOSE cur_class;
        
    END LOOP;
    CLOSE cur_course;
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------');

EXCEPTION
    WHEN OTHERS THEN
        IF cur_course%ISOPEN THEN CLOSE cur_course; END IF;
        IF cur_class%ISOPEN THEN CLOSE cur_class; END IF;
        DBMS_OUTPUT.PUT_LINE('Loi he thong: ' || SQLERRM);
END;
/
-- Bài 4
-- 1a
CREATE OR REPLACE PROCEDURE find_sname (
    p_MaSinhVien IN  SINH_VIEN.MaSinhVien%TYPE,
    p_Ten        OUT SINH_VIEN.Ten%TYPE,
    p_Ho         OUT SINH_VIEN.Ho%TYPE
)
IS
BEGIN
    SELECT Ten, Ho
    INTO p_Ten, p_Ho
    FROM SINH_VIEN
    WHERE MaSinhVien = p_MaSinhVien;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_Ten := NULL;
        p_Ho  := NULL;
        DBMS_OUTPUT.PUT_LINE('Khong tim thay sinh vien co ma: ' || p_MaSinhVien);
    WHEN OTHERS THEN
        p_Ten := NULL;
        p_Ho  := NULL;
        DBMS_OUTPUT.PUT_LINE('Loi he thong: ' || SQLERRM);
END find_sname;
/
-- 1b
CREATE OR REPLACE PROCEDURE print_student_name (
    p_MaSinhVien IN SINH_VIEN.MaSinhVien%TYPE
)
IS
    v_ten SINH_VIEN.Ten%TYPE;
    v_ho  SINH_VIEN.Ho%TYPE;
BEGIN
    -- Goi thu tuc find_sname da co san (Truyen vao ma SV, nhan ve Ten va Ho)
    find_sname(p_MaSinhVien, v_ten, v_ho);

    -- Neu tim thay (Ho hoac Ten khong bi NULL) thi in ra man hinh
    IF v_ho IS NOT NULL OR v_ten IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('=> Ket qua: Ho ten sinh vien la: ' || v_ho || ' ' || v_ten);
    END IF;
END print_student_name;
/

-- Bat Server Output de xem ket qua in ra man hinh
SET SERVEROUTPUT ON;

-- Goi thu tuc de kiem tra:
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Kich ban 1: Sinh vien ton tai ---');
    print_student_name(1001); 

    DBMS_OUTPUT.PUT_LINE('--- Kich ban 2: Sinh vien khong ton tai ---');
    print_student_name(9999); 
END;
/
-- 4.2
-- 1. T?o th? t?c
CREATE OR REPLACE PROCEDURE Discount
IS
BEGIN
    -- V?ng l?p t? ð?ng duy?t qua các môn h?c có sinh viên ðãng k? (> 0)
    FOR rec IN (
        SELECT c.MaMonHoc, c.TenMonHoc, c.HocPhi
        FROM MON_HOC c
        WHERE (
            -- Ð?m t?ng s? sinh viên ðãng k? các l?p thu?c môn h?c này
            SELECT COUNT(*) 
            FROM DANG_KY e
            JOIN LOP_HOC cl ON e.MaLopHoc = cl.MaLopHoc
            WHERE cl.MaMonHoc = c.MaMonHoc
        ) > 0 -- Ðang ð? > 0 ð? d? test. B?n ð?i thành 15 n?u c?n nhé!
    ) 
    LOOP
        -- Gi?m giá 5% (C?p nh?t tr?c ti?p vào b?ng)
        UPDATE MON_HOC
        SET HocPhi = HocPhi * 0.95
        WHERE MaMonHoc = rec.MaMonHoc;

        -- In thông báo ra màn h?nh
        DBMS_OUTPUT.PUT_LINE('Da giam gia mon hoc: ' || rec.TenMonHoc 
            || ' | Gia cu: ' || rec.HocPhi 
            || ' | Gia moi: ' || ROUND(rec.HocPhi * 0.95, 2));
    END LOOP;

    -- Lýu d? li?u v?nh vi?n
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('-----------------------------');
    DBMS_OUTPUT.PUT_LINE('Hoan tat kiem tra va giam gia!');
    
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Loi he thong: ' || SQLERRM);
END Discount;
/

-- 2. B?t ch?c nãng hi?n th? k?t qu?
SET SERVEROUTPUT ON;

-- 3. G?i th? t?c ð? ch?y ki?m tra
BEGIN 
    Discount; 
END;
/
-- 4.3
CREATE OR REPLACE FUNCTION Total_cost_for_student (
    p_student_id IN SINH_VIEN.MaSinhVien%TYPE
)
RETURN NUMBER
IS
    v_total NUMBER;
    v_check NUMBER;
BEGIN
    -- 1. Kiem tra sinh vien co ton tai khong
    SELECT COUNT(*) INTO v_check
    FROM SINH_VIEN WHERE MaSinhVien = p_student_id;

    IF v_check = 0 THEN
        RETURN NULL; -- Sinh vien khong ton tai
    END IF;

    -- 2. Tinh tong chi phi: Tong HocPhi cua cac mon sinh vien do da dang ky
    SELECT NVL(SUM(co.HocPhi), 0)
    INTO v_total
    FROM DANG_KY e
    JOIN LOP_HOC cl ON e.MaLopHoc = cl.MaLopHoc
    JOIN MON_HOC co ON cl.MaMonHoc = co.MaMonHoc
    WHERE e.MaSinhVien = p_student_id;

    RETURN v_total;

EXCEPTION
    WHEN OTHERS THEN
        RETURN NULL;
END Total_cost_for_student;
/
SELECT Total_cost_for_student(1001) AS "Tong Chi Phi (VNÐ)" FROM DUAL;
//5.1
-- 1. TRIGGER CHO B?NG MÔN H?C
CREATE OR REPLACE TRIGGER trg_mon_hoc_audit
BEFORE INSERT OR UPDATE ON MON_HOC
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.NguoiTao := USER;
        :NEW.NgayTao := SYSDATE;
    END IF;
    
    -- Luon cap nhat thong tin "Sua" (ca khi INSERT lan UPDATE)
    :NEW.NguoiSua := USER;
    :NEW.NgaySua := SYSDATE;
END;
/

-- 2. TRIGGER CHO B?NG L?P H?C
CREATE OR REPLACE TRIGGER trg_lop_hoc_audit
BEFORE INSERT OR UPDATE ON LOP_HOC
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.NguoiTao := USER;
        :NEW.NgayTao := SYSDATE;
    END IF;
    :NEW.NguoiSua := USER;
    :NEW.NgaySua := SYSDATE;
END;
/

-- 3. TRIGGER CHO B?NG SINH VIÊN
CREATE OR REPLACE TRIGGER trg_sinh_vien_audit
BEFORE INSERT OR UPDATE ON SINH_VIEN 
FOR EACH ROW
BEGIN
    IF INSERTING THEN 
        :NEW.NguoiTao := USER; 
        :NEW.NgayTao := SYSDATE; 
    END IF;
    :NEW.NguoiSua := USER; 
    :NEW.NgaySua := SYSDATE;
END; 
/

-- 4. TRIGGER CHO B?NG ÐÃNG K?
CREATE OR REPLACE TRIGGER trg_dang_ky_audit
BEFORE INSERT OR UPDATE ON DANG_KY 
FOR EACH ROW
BEGIN
    IF INSERTING THEN 
        :NEW.NguoiTao := USER; 
        :NEW.NgayTao := SYSDATE; 
    END IF;
    :NEW.NguoiSua := USER; 
    :NEW.NgaySua := SYSDATE;
END; 
/

-- 5. TRIGGER CHO B?NG GIÁO VIÊN
CREATE OR REPLACE TRIGGER trg_giao_vien_audit
BEFORE INSERT OR UPDATE ON GIAO_VIEN 
FOR EACH ROW
BEGIN
    IF INSERTING THEN 
        :NEW.NguoiTao := USER; 
        :NEW.NgayTao := SYSDATE; 
    END IF;
    :NEW.NguoiSua := USER; 
    :NEW.NgaySua := SYSDATE;
END; 
/

-- 6. TRIGGER CHO B?NG ÐI?M
CREATE OR REPLACE TRIGGER trg_diem_audit
BEFORE INSERT OR UPDATE ON DIEM 
FOR EACH ROW
BEGIN
    IF INSERTING THEN 
        :NEW.NguoiTao := USER; 
        :NEW.NgayTao := SYSDATE; 
    END IF;
    :NEW.NguoiSua := USER; 
    :NEW.NgaySua := SYSDATE;
END; 
/
--5.2
CREATE OR REPLACE TRIGGER trg_max_dang_ky
FOR INSERT ON DANG_KY
COMPOUND TRIGGER
    -- Khai báo m?t m?ng ð? lýu danh sách m? sinh viên v?a ðý?c chèn
    TYPE t_sv_ids IS TABLE OF DANG_KY.MaSinhVien%TYPE;
    v_ds_sinh_vien t_sv_ids := t_sv_ids();

    AFTER EACH ROW IS
    BEGIN
        v_ds_sinh_vien.EXTEND;
        v_ds_sinh_vien(v_ds_sinh_vien.LAST) := :NEW.MaSinhVien;
    END AFTER EACH ROW;

    AFTER STATEMENT IS
        v_count NUMBER;
    BEGIN
        FOR i IN 1 .. v_ds_sinh_vien.COUNT LOOP
            SELECT COUNT(*) INTO v_count 
            FROM DANG_KY 
            WHERE MaSinhVien = v_ds_sinh_vien(i);

            IF v_count > 3 THEN
                RAISE_APPLICATION_ERROR(-20001, 'Loi: Sinh vien ' || v_ds_sinh_vien(i) || ' da dang ky qua 3 mon!');
            END IF;
        END LOOP;
    END AFTER STATEMENT;
END;
/
INSERT INTO DANG_KY (MaSinhVien, MaLopHoc, NgayGhiDanh, NgayDangKy) VALUES (1001, 504, SYSDATE, SYSDATE);
INSERT INTO DANG_KY (MaSinhVien, MaLopHoc, NgayGhiDanh, NgayDangKy)
VALUES (1001, 501, SYSDATE, SYSDATE);

INSERT INTO DANG_KY (MaSinhVien, MaLopHoc, NgayGhiDanh, NgayDangKy) VALUES (1001, 502, SYSDATE, SYSDATE);
INSERT INTO DANG_KY (MaSinhVien, MaLopHoc, NgayGhiDanh, NgayDangKy) VALUES (1001, 503, SYSDATE, SYSDATE);