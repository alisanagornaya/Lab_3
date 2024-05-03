chcp 65001 > nul
mkdir "Скрита папка"
mkdir "Не скрита папка"
attrib +h "Скрита папка"
cd "Не скрита папка"
help xcopy > copyhelp.txt 
xcopy /c copyhelp.txt ..\"Скрита папка"\copied_copyhelp.txt