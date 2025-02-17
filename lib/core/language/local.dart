import 'package:get/get.dart';

class local implements Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    "ar": {
      "Log": "تسجيل", 
      "in" : " الدخول", 
      "Email": "البريد الالكتروني", 
      "Enter Your Email": "ادخل بريدك الالكتروني" , 
      "Enter Your Password" :"ادخل كلمة المرور", 
      "Password": "كلمة المرور" , 
      "Enter confirm Password" : "تاكيد كلمة المرور",
      "Confirm password" : "تاكيد الكلمة" ,
      "Login": "تسجيل دخول", 
      "Dont have an account? " :" لا تملك حساب؟  "  , 
      "Sign" : "إنشاء " , 
      "Up": "حساب",
      "SignUp" : "إنشاء حساب", 
      "not valid username" : "اسم المستخدم غير صالح", 
      "not valid email" : "البريد الالكتروني غير صالح" , 
      "not valid phone" : " رقم الهاتف غير صالح" , 
      "not valid password" : "كلمة مرور غير صالحة",
      "can't be less than" : "لا يمكن ان تكون اقل  من", 
      "can't be larger than" : "لا يمكن ان تكون اكبر من", 
      "can't be Empty" : "لا يمكن ان يكون فارغ" , 
      "Create " : "إنشاء " , 
      "New " :"اختبار " , 
      "Quiz" : "الاختبار",
      "Season" : "الفصل" , 
      "Subject" : "المادة" , 
      "year" : "السنة" , 
      "title" : "العنوان",
      "Enter Quiz title" : "ادخل عنوان الاختبار",
      "mark" : "علامة " , 
      "Enter Quiz mark" : "ادخل علامة الاختبار" ,
      "time" : "وقت ", 
      "Enter Quiz time" : "ادخل وقت الاختبار", 
      "Create New Quiz" : "إنشاء اختبار جديد", 
      "Create Quiz" : "إنشاء الاختبار",
      "Quiz Date" :"تاريخ الاختبار", 
      "Question added" : "تمت اضافة الؤال", 
      "you only have" : "انت تملك ", 
      "mark left": "علامة متبقة ",
      "Ok" : "حسناً" ,
      "quiz ID is :" : "كود الاختبار هو :", 
      "write the Quistion" : "اكتب السؤال ", 
      "Quistion" : "السؤال", 
      "Send Quistion" : "إرسال السؤال", 
      "Send Quiz" : "إرسال الاختبار", 
      "Add Students" :"إضافة طلاب",
      "Show Detailes" : "اظهر التفاصيل", 
      "Student list have been added ,\n so you can't cancle the Quiz" :"تمت اضافة قوائم الطلاب ,\n لذلك لا يمكنك الغاء الاختبار", 
      "Quistion Mark is :": "علامة السؤال هي :", 
      "Edit" : "تعديل", 
      "Quiz mark : " : "علامة الاختبار : ", 
      "Quiz time : ": "وقت الاختبار : ", 
      "remining markings : " : "العامات المتبقية : ", 
      "Quiz Edit" : "تعديل الاختبار", 
      "Edit Quistion" : "تعديل السؤال", 
      "remining" : "المتبقية",
      "the field of this choice must be mobilized" : "يجب تعبئة الحقل الخاص بهذا الاختيار", 
      "choice C must be mobilized first" : "يجب نعبئة الخيار سي اولا",
      "Active":"تفعيل", 
      "Quiz ID is :":"المعرف:", 
      "Quiz title is:":"العنوان:", 
      "minute":"دقيقة", 
      "Quiz time:" :"الوقت:", 
      "Quiz mark:" :"العلامة:", 
      "Delete" :"حذف",
      "one choice must be chosen" : "يجب اختيار احد الاختيارات", 
      "if you delete this question , the entire quiz will be deleted for lack of question":"اذا قمت بحذف هذا السؤال فسوف يتم حذف كامل الاختبار لعدم وجود اسئلة",
      "cancle":"الغاء"
    }, 
    "en":{
      "Log":"Log",
      "in":"in", 
      "Email": "Email", 
      "Enter Your Email":"Enter Your Email" , 
      "Enter Your Password": "Enter Your Password", 
      "Password" : "Password",
      "Enter confirm Password" : "Enter confirm Password" , 
      "Confirm password" : "Confirm password" ,
      "Login":"Login", 
      "Dont have an account? " :"Dont have an account? ", 
      "Sign" : "Sign", 
      "Up" :"Up",
      "SignUp" : "SignUp" , 
      "not valid username":"not valid username" ,
      "not valid email" :"not valid email" , 
      "not valid phone" : "not valid phone" , 
      "not valid password" : "not valid password",
      "can't be less than" : "can't be less than", 
      "can't be larger than" : "can't be larger than" , 
      "can't be Empty" : "can't be Empty" ,
      "Create " : "Create ", 
      "New " : "New ", 
      "Quiz" : "Quiz", 
      "Season" : "Season" , 
      "Subject" : "Subject", 
      "year" : "year" ,
      "title" : "title" ,
      "Enter Quiz title" : "Enter Quiz title", 
      "mark" : " mark" ,
      "Enter Quiz mark" : "Enter Quiz mark" ,
      "time" : " time", 
      "Enter Quiz time" : "Enter Quiz time", 
      "Create New Quiz" : "Create New Quiz", 
      "Create Quiz" : "Create Quiz" , 
      "Quiz Date" : "Quiz Date" , 
      "Question added" : "Question added" ,
      "you only have" :"you only have ", 
      "mark left" : "mark left ", 
      "Ok" : "Ok" , 
      "quiz ID is :" : "quiz ID is :", 
      "write the Quistion" : "write the Quistion" , 
      "Quistion" : "Quistion", 
      "Send Quistion" : "Send Quistion", 
      "Send Quiz" : "Send Quiz", 
      "Add Students" : "Add Students" , 
      "Show Detailes":"Show detailes",
      "Student list have been added ,\n so you can't cancle the Quiz": "Student list have been added ,\n so you can't cancle the Quiz",  
      "Quistion Mark is :" : "Quistion Mark is :", 
      "Edit": "Edit", 
      "Quiz mark : " :"Quiz mark : ", 
      "Quiz time : ": "Quiz time : ", 
      "remining markings : ":"remining markings : ",
      "Quiz Edit" : "Quiz Edit" ,
      "Edit Quistion" : "Edit Quistion", 
      "remining": "remining", 
      "the field of this choice must be mobilized" : "the field of this choice must be mobilized",
      "choice C must be mobilized first":"choice C must be mobilized first", 
      "Active": "Active",
      "Quiz ID is" :"Quiz ID is :",
      "Quiz title is:": "Quiz title is:", 
      "minute":"minute",
      "Quiz time":"Quiz time", 
      "Quiz mark:":"Quiz mark:", 
      "Delete": "Delete", 
      "one choice must be chosen":"one choice must be chosen", 
      "if you delete this question , the entire quiz will be deleted for lack of question":"if you delete this question , the entire quiz will be deleted for lack of question", 
      "cancle":"cancle"
    }
  };

}