import 'package:shifa/core/assets/images/image_assets.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/models/blog_model.dart';
import 'package:shifa/core/models/clinic_model.dart';
import 'package:shifa/core/models/radiolog_model.dart';

class AppConstants {
  static const String lognText =
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.";
  List<BlogModel> blogsList = [
    BlogModel(
      imageUrl: ImageAssets.blogImg1,
      subTitle:
          "is simply dummy text of the printing and typesetting industry.",
      title:
          "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
    ),
    BlogModel(
      imageUrl: ImageAssets.blogImg2,
      subTitle:
          "is simply dummy text of the printing and typesetting industry.",
      title:
          "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
    ),
    BlogModel(
      imageUrl: ImageAssets.blogImg3,
      subTitle:
          "is simply dummy text of the printing and typesetting industry.",
      title:
          "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
    ),
    BlogModel(
      imageUrl: ImageAssets.blogImg4,
      subTitle:
          "is simply dummy text of the printing and typesetting industry.",
      title:
          "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
    ),
    BlogModel(
      imageUrl: ImageAssets.blogImg5,
      subTitle:
          "is simply dummy text of the printing and typesetting industry.",
      title:
          "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
    ),
  ];

  List<RadiologyModel> radiologyList = [
    RadiologyModel(
      date: "21 Oct, 2024",
      status: "Completed",
      title: "MRI for Brain",
      doctorName: "Dr.Fady Mohamed Nabil",
    ),
    RadiologyModel(
      date: "21 Aug, 2024",
      status: "Completed",
      title: "MRI for Brain",
      doctorName: "Dr.Fady Mohamed Nabil",
    ),
    RadiologyModel(
      status: "Completed",
      title: "MRI for Brain",
      date: "21 Sep, 2024",
      doctorName: "Dr.Fady Mohamed Nabil",
    ),
    RadiologyModel(
      status: "Completed",
      title: "MRI for Brain",
      date: "21 Jun, 2024",
      doctorName: "Dr.Fady Mohamed Nabil",
    ),
  ];
  List<ClinicModel> clinics = [
    ClinicModel(
      clinicName: "Internal Medicine",
      clinicIcon: SVGAssets.internalMedicineIcon,
    ),
    ClinicModel(
      clinicName: "Chest Diseases",
      clinicIcon: SVGAssets.chestIcon,
    ),
    ClinicModel(
      clinicName: "Ear, Nose & Throat",
      clinicIcon: SVGAssets.earIcon,
    ),
    ClinicModel(
      clinicName: "Cardiology",
      clinicIcon: SVGAssets.cardioIcon,
    ),
    ClinicModel(
      clinicName: "Neurology",
      clinicIcon: SVGAssets.neurologyIcon,
    ),
    ClinicModel(
      clinicName: "Neurosurgery",
      clinicIcon: SVGAssets.neurosurgeryIcon,
    ),
    ClinicModel(
      clinicName: "Diabetes and Endocrinology",
      clinicIcon: SVGAssets.diabitesIcon,
    ),
    ClinicModel(
      clinicName: "General Surgery",
      clinicIcon: SVGAssets.generalSurgeryIcon,
    ),
    ClinicModel(
      clinicName: "Obstetrics & Gynecology",
      clinicIcon: SVGAssets.obstetricsIcon,
    ),
    ClinicModel(
      clinicName: "Orthopedic",
      clinicIcon: SVGAssets.orthopedicIcon,
    ),
    ClinicModel(
      clinicName: "Ophthalmology",
      clinicIcon: SVGAssets.opthIcon,
    ),
    ClinicModel(
      clinicName: "Nephrology",
      clinicIcon: SVGAssets.nephroIcon,
    ),
    ClinicModel(
      clinicName: "Pediatrics",
      clinicIcon: SVGAssets.pediatricsIcon,
    ),
    ClinicModel(
      clinicName: "Immunology & Allergy",
      clinicIcon: SVGAssets.imuunologyIcon,
    ),
    ClinicModel(
      clinicName: "Geriatrics",
      clinicIcon: SVGAssets.geriaticsIcon,
    ),
    ClinicModel(
      clinicName: "Pain Management",
      clinicIcon: SVGAssets.painIcon,
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
