# مستندات پروژه Flutter: برنامه خوش‌آمدگویی  

## مقدمه  
این پروژه یک اپلیکیشن ساده Flutter است که شامل یک صفحه ورود با فیلد ورودی نام و یک دکمه برای نمایش پیام خوش‌آمدگویی است. برنامه از راست به چپ تنظیم شده است تا برای کاربران فارسی‌زبان مناسب باشد.  

---

## پیش‌نیازها  
برای اجرای این پروژه، نیاز به نصب و راه‌اندازی موارد زیر دارید:  

- آخرین نسخه **Flutter SDK** را از [وب‌سایت رسمی Flutter](https://flutter.dev) دریافت کنید.)
- **یک ویرایشگر کد** (مانند VS Code یا Android Studio)  
- **دستگاه فیزیکی یا شبیه‌ساز اندروید/آی‌او‌اس**  

---

## نحوه اجرای پروژه  
* ابتدا مخزن پروژه را کلون کنید یا فایل‌های پروژه را در یک پوشه قرار دهید.
* ترمینال را باز کنید و به مسیر پروژه بروید.
* دستور زیر را برای دریافت وابستگی‌ها اجرا کنید:  
    ```
   flutter pub get  
    
  
* برای اجرای برنامه، از این دستور استفاده کنید:
    ```
   flutter run
   
---

## ساختار پروژه
    
    /project-folder
    │── lib/
    │   ├── main.dart   # فایل اصلی برنامه
    │── pubspec.yaml    # فایل پیکربندی و وابستگی‌ها
    │── android/        # فایل‌های مربوط به اندروید
    │── ios/            # فایل‌های مربوط به آی‌او‌اس
    │── assets/         # فایل‌های مربوط به منابع (در صورت نیاز)


## توضیح کد
فایل main.dart شامل دو کلاس MyApp و WelcomeScreen است. در ادامه، بخش‌های مهم این فایل توضیح داده شده‌اند:

---
## اجرای برنامه

    
    void main() {
        runApp(MyApp());
    }

این تابع، برنامه را اجرا کرده و MyApp را به عنوان ویجت اصلی تنظیم می‌کند.

---

## اجرای برنامه
  
    class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(148, 232, 216, 216),
            ),
          ),
          home: Directionality(
            textDirection: TextDirection.rtl, // راست‌چین کردن کل اپلیکیشن
            child: WelcomeScreen(),
          ),
        );
      }
    }

ویجت MaterialApp ویجت اصلی اپلیکیشن را تعریف می‌کند.  
ویجت Directionality برای تنظیم راست‌چین بودن کل برنامه استفاده شده است.  
ویجت WelcomeScreen به عنوان صفحه اصلی نمایش داده می‌شود.  

---
## کلاس WelcomeScreen
  
  class _WelcomeScreenState extends State<WelcomeScreen> {
    TextEditingController _nameController = TextEditingController();
    String _welcomeMessage = '';
  
    void _showWelcomeMessage() {
      setState(() {
        _welcomeMessage = 'سلام ${_nameController.text}، خوش آمدی!';
      });
    }
  }

دستور TextEditingController برای خواندن مقدار وارد شده توسط کاربر استفاده می‌شود.  
دستور _showWelcomeMessage() مقدار متن ورودی را خوانده و پیام خوش‌آمدگویی را تنظیم می‌کند.  

---
## ویجت‌های صفحه

  
    return Scaffold(
      appBar: AppBar(title: Text('فرم ورود')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'نام خود را وارد کنید',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _showWelcomeMessage,
              child: Text('ورود'),
            ),
            SizedBox(height: 20),
            Text(
              _welcomeMessage,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );

  دستور TextField برای ورود نام کاربر است.  
  دستور ElevatedButton دکمه‌ای است که پیام خوش‌آمدگویی را نمایش می‌دهد.  
  دستور Text پیام خوش‌آمدگویی را نمایش می‌دهد.  

---

## امکانات و ویژگی‌ها
  ✅ رابط کاربری ساده و قابل فهم  
  ✅ پشتیبانی از زبان فارسی و راست‌چین شدن خودکار  
  ✅ دریافت ورودی از کاربر و نمایش پیام خوش‌آمدگویی  

## بهبودهای پیشنهادی
  🔷 افزودن امکان تغییر رنگ تم برنامه  
  🔷 اضافه کردن اعتبارسنجی ورودی (مثلاً جلوگیری از ورود نام خالی)  
  🔷 افزودن انیمیشن برای نمایش پیام خوش‌آمدگویی  


