# مستندات پروژه Flutter: تغییر تم برنامه

## مقدمه  
این پروژه یک اپلیکیشن Flutter است که به کاربر این امکان را می‌دهد که تم برنامه را بین حالت‌های "روشن" و "تاریک" تغییر دهد. وضعیت تم در `SharedPreferences` ذخیره می‌شود تا هنگام بازگشایی مجدد برنامه، تم قبلی بازیابی شود. این پروژه از فریم‌ورک Flutter برای طراحی رابط کاربری و مدیریت وضعیت استفاده می‌کند.

---

## پیش‌نیازها  
برای اجرای این پروژه، نیاز به نصب و راه‌اندازی موارد زیر دارید:  

- آخرین نسخه **Flutter SDK** را از [وب‌سایت رسمی Flutter](https://flutter.dev) دریافت کنید.
- **یک ویرایشگر کد** (مانند VS Code یا Android Studio)
- **دستگاه فیزیکی یا شبیه‌ساز اندروید/آی‌او‌اس**  

---

## نحوه اجرای پروژه  
* ابتدا مخزن پروژه را کلون کنید یا فایل‌های پروژه را در یک پوشه قرار دهید.
* ترمینال را باز کرده و به مسیر پروژه بروید.
* دستور زیر را برای دریافت وابستگی‌ها اجرا کنید:  
    ```
   flutter pub get  
    ```
* برای اجرای برنامه، از این دستور استفاده کنید:
    ```
   flutter run
    ```

---

## ساختار پروژه

    /project-folder
    │── lib/
    │   ├── main.dart   # فایل اصلی برنامه
    │── pubspec.yaml    # فایل پیکربندی و وابستگی‌ها
    │── android/        # فایل‌های مربوط به اندروید
    │── ios/            # فایل‌های مربوط به آی‌او‌اس
    │── assets/         # فایل‌های مربوط به منابع (در صورت نیاز)

---

## توضیح کد

فایل `main.dart` شامل کلاس‌های اصلی برنامه است که شامل ویجت‌ها و متدهای مورد نیاز برای تغییر تم است. در ادامه، بخش‌های مهم این فایل توضیح داده شده‌اند:

---

### اجرای برنامه

    void main() async {
      WidgetsFlutterBinding.ensureInitialized();
      bool isDarkMode = await getThemePreference();
      runApp(MyApp(isDarkMode: isDarkMode));
    }

در این بخش، برنامه با فراخوانی runApp و بارگذاری وضعیت تم از SharedPreferences آغاز می‌شود.

## دریافت وضعیت تم

    Future<bool> getThemePreference() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getBool('isDarkMode') ?? false;
    }
این متد به طور غیرهمزمان وضعیت تم (روشن یا تاریک) را از SharedPreferences می‌خواند و در صورتی که هیچ مقداری پیدا نشد، پیش‌فرض حالت روشن (false) را برمی‌گرداند.

## کلاس MyApp

    class MyApp extends StatefulWidget {
      final bool isDarkMode;
      MyApp({required this.isDarkMode});
    
      @override
      _MyAppState createState() => _MyAppState();
    }
کلاس MyApp یک StatefulWidget است که وضعیت تم را ذخیره کرده و به روز می‌کند. تم برنامه در هنگام بارگذاری اپلیکیشن از طریق widget.isDarkMode مقداردهی می‌شود.

## تغییر تم
    void _toggleTheme() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        _isDarkMode = !_isDarkMode;
        prefs.setBool('isDarkMode', _isDarkMode);
      });
    }
این متد وضعیت تم را با فشار دادن دکمه تغییر می‌دهد و آن را در SharedPreferences ذخیره می‌کند.

## رابط کاربری
    Scaffold(
      appBar: AppBar(
        title: Text('تغییر تم برنامه'),
        actions: [
          IconButton(
            icon: Icon(_isDarkMode ? Icons.nightlight_round : Icons.wb_sunny),
            onPressed: _toggleTheme,
          ),
        ],
      ),
      body: Center(
        child: Text('حالت فعلی: ${_isDarkMode ? "تاریک" : "روشن"}'),
      ),
    );
در این بخش، یک AppBar با یک دکمه برای تغییر تم در نظر گرفته شده است. وضعیت تم با استفاده از IconButton و تغییر آیکون از خورشید به ماه یا برعکس نمایش داده می‌شود.

## امکانات و ویژگی‌ها
✅ امکان تغییر تم بین حالت‌های "روشن" و "تاریک"  
✅ ذخیره وضعیت تم در SharedPreferences  
✅ رابط کاربری ساده و قابل فهم  
✅ استفاده از Flutter برای مدیریت رابط کاربری و وضعیت  

## بهبودهای پیشنهادی
🔷 افزودن امکان انتخاب تم‌های سفارشی  
🔷 اضافه کردن انیمیشن برای تغییر تم  
🔷 امکان تغییر رنگ تم برای سایر بخش‌های برنامه  
