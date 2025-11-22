import os
import subprocess

# ----------------------------------------
# Cấu hình chung
a = 24
x1 = 399
y1 = 689
# ----------------------------------------

print("============================================")
print("Python - In nhiều text lên nhiều ảnh (_add_text)")
print("============================================")

# Nhập danh sách file ảnh
files_input = input("Nhập đường dẫn các file ảnh (cách nhau bằng dấu cách): ").strip()
if not files_input:
    print("Bạn chưa nhập file ảnh. Thoát.")
    exit()

files = files_input.split()

# Nhập số lần muốn thêm text
while True:
    try:
        num_texts = int(input("Nhập số lần muốn thêm text: ").strip())
        if num_texts <= 0:
            raise ValueError
        break
    except ValueError:
        print("Nhập số nguyên > 0. Nhập lại.")

# Nhập nhiều dòng seg pos text
text_entries = []
for i in range(1, num_texts + 1):
    while True:
        line = input(f"Nhập dòng {i} (vd: 0 1 1b hoặc 2 2 1c): ").strip()
        tokens = line.split()
        if len(tokens) < 3:
            print("Nhập không hợp lệ. Nhập lại.")
            continue
        seg_str, pos_str, text = tokens[0], tokens[1], " ".join(tokens[2:])
        try:
            seg = int(seg_str)
            pos = int(pos_str)
        except ValueError:
            print("Đoạn và vị trí phải là số. Nhập lại.")
            continue
        if not (0 <= seg <= 3):
            print("Đoạn phải từ 0 đến 3. Nhập lại.")
            continue
        if not (1 <= pos <= 7):
            print("Vị trí phải từ 1 đến 7. Nhập lại.")
            continue
        if not text:
            print("Nội dung text không được để trống. Nhập lại.")
            continue
        text_entries.append((seg, pos, text))
        break

# Xử lý từng file ảnh
for file_path in files:
    if not os.path.exists(file_path):
        print(f"File {file_path} không tồn tại. Bỏ qua.")
        continue

    fname, ext = os.path.splitext(file_path)
    newname = f"{fname}_add{ext}"

    # Tạo filter cho tất cả text
    filters = []
    for seg, pos, text in text_entries:
        if seg == 0:
            # đoạn 0 nằm bên trái đoạn 1
            pos_total = (0) * 7 + (pos - 1) - 7
        else:
            pos_total = (seg - 1) * 7 + (pos - 1)
        xpos = x1 + pos_total * a
        ypos = y1
        filters.append(
            f"drawtext=fontfile='C\\:/Windows/Fonts/arial.ttf':text='{text}':x={xpos}:y={ypos}:fontsize=22:fontcolor=white:borderw=2"
        )

    filter_str = ",".join(filters)

    ffmpeg_cmd = [
        "ffmpeg",
        "-y",
        "-i", file_path,
        "-vf", filter_str,
        newname
    ]

    print(f"Đang xử lý: {file_path}")
    subprocess.run(ffmpeg_cmd)

print("Hoàn thành! Tất cả ảnh đã được lưu với tên mới (_add).")
