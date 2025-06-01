import 'package:shifa/core/models/radiolog_model.dart';

class AppConstants {
  static const String lognText =
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.";


  List<RecordsModel> recordsList = [
    RecordsModel(
      date: "21 Oct, 2024",
      status: "Completed",
      title: "MRI for Brain",
      doctorName: "Dr.Fady Mohamed Nabil",
    ),
    RecordsModel(
      date: "21 Aug, 2024",
      status: "Completed",
      title: "MRI for Brain",
      doctorName: "Dr.Fady Mohamed Nabil",
    ),
    RecordsModel(
      status: "Completed",
      title: "MRI for Brain",
      date: "21 Sep, 2024",
      doctorName: "Dr.Fady Mohamed Nabil",
    ),
    RecordsModel(
      status: "Completed",
      title: "MRI for Brain",
      date: "21 Jun, 2024",
      doctorName: "Dr.Fady Mohamed Nabil",
    ),
  ];
  List<String> specialities = [
    "Internal Medicine",
    "Chest Diseases",
    "Ear, Nose & Throat",
    "Cardiology",
    "Neurology",
    "Neurosurgery",
    "Diabetes and Endocrinology",
    "General Surgery",
    "Obstetrics & Gynecology",
    "Orthopedic",
    "Ophthalmology",
    "Nephrology",
    "Pediatrics",
    "Immunology & Allergy",
    "Geriatrics",
    "Pain Management",
  ];

  List<String> doctorsJobTitle = [
    "Doctor",
    "Professor Doctor",
    "Assistant Professor",
    "Consultant Physician",
    "Specialist Doctor",
  ];
}
