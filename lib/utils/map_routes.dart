import 'package:google_maps_flutter/google_maps_flutter.dart';

//Defense lab to mandoor
const List<LatLng> route1 = [
  LatLng(26.271546, 73.037091),
  LatLng(26.273929, 73.036009),
  LatLng(26.275106, 73.036318),
  LatLng(26.277883, 73.036774),
  LatLng(26.281277, 73.037992),
  LatLng(26.285248, 73.038759),
  LatLng(26.286217, 73.037029),
  LatLng(26.286337, 73.036782),
  LatLng(26.286532, 73.036766),
  LatLng(26.286787, 73.036857),
  LatLng(26.288299, 73.036653),
  LatLng(26.288491, 73.036803),
  LatLng(26.289766, 73.038748),
  LatLng(26.289933, 73.038862),
  LatLng(26.293787, 73.038700),
  LatLng(26.293877, 73.038568),
  LatLng(26.294021, 73.038529),
  LatLng(26.294021, 73.038529),
  LatLng(26.294382, 73.038710),
  LatLng(26.295061, 73.038738),
  LatLng(26.297183, 73.038472), //paota
  LatLng(26.305495, 73.037790),
  LatLng(26.309105, 73.038083),
  LatLng(26.311652, 73.040193),
  LatLng(26.312548, 73.041139),
  LatLng(26.319576, 73.044797),
  LatLng(26.320542, 73.045224),
  LatLng(26.321846, 73.045099),
  LatLng(26.323780, 73.044522),
  LatLng(26.326039, 73.044033),
  LatLng(26.326983, 73.043418),
  LatLng(26.327231, 73.043293),
  LatLng(26.328355, 73.041813),
  LatLng(26.329074, 73.041499),
  LatLng(26.329434, 73.041537),
  LatLng(26.330468, 73.042289),
  LatLng(26.331131, 73.042415),
  LatLng(26.342184, 73.038971),
  LatLng(26.348444, 73.038058),
];

const List route1Stops = [
  "Mandore",
  "BSF Campus Jodhpur",
  "Kishore Bagh palace",
  "Krishi Mandi Circle",
  "Bhadwasiya bus station",
  "Mahamandir circle",
  "Paota circle",
  "Umed Club Circle",
  "K.N.College Rd",
  "Power House Circle",
  "Vishwakarma circle",
  "The Blue City Mall",
  "Ganesh Mandir Rd",
  "Bhati Chowraha",
  "Ratanada Circle",
  "Panch Batti"
];
//  Banar to CHB
const List<LatLng> route2 = [
  LatLng(26.343001, 73.153722), //Banar
  LatLng(26.315153, 73.098753), //Nandri
  LatLng(26.312530, 73.094226), //Ramjan ji  ka hatta
  LatLng(26.303961, 73.074971),
  LatLng(26.300941, 73.067853),
  LatLng(26.299852, 73.062324),
  LatLng(26.298425, 73.058779),
  LatLng(26.294797, 73.055743),
  LatLng(26.293451, 73.050979),
  LatLng(26.294260, 73.039049), //Paota circle
  LatLng(26.293666, 73.038681),
  LatLng(26.290399, 73.038793),
  LatLng(26.288307, 73.036646),
  LatLng(26.286901, 73.036892),
  LatLng(26.286398, 73.036803),
  LatLng(26.285293, 73.038775),
  LatLng(26.259953, 72.969297) //CHB
];
const List route2Stops = [];

//Ghantaghar to basni
const List<LatLng> route3 = [
  LatLng(26.294039, 73.024238),
  LatLng(26.288469, 73.025845),
  LatLng(26.288325, 73.024407),
  LatLng(26.287783, 73.023364),
  LatLng(26.284013, 73.022087),
  LatLng(26.283955, 73.022066),
  LatLng(26.283796, 73.022090),
  LatLng(26.283700, 73.022041),
  LatLng(26.283667, 73.021888),
  LatLng(26.283789, 73.021805),
  LatLng(26.283881, 73.021838),
  LatLng(26.285378635904948, 73.02035756384743),
  LatLng(26.283931, 73.017725),
  LatLng(26.284334, 73.016321),
  LatLng(26.284214, 73.016240),
  LatLng(26.284187, 73.016046),
  LatLng(26.283783, 73.015812),
  LatLng(26.283444, 73.015577),
  LatLng(26.282811, 73.015176),
  LatLng(26.282393134632986, 73.01495035179242),
  LatLng(26.28208576935201, 73.01478627515695),
  LatLng(26.281733, 73.014660),
  LatLng(26.281286, 73.014625),
  LatLng(26.281189, 73.014649),
  LatLng(26.281100, 73.014595),
  LatLng(26.280809, 73.014639),
  LatLng(26.279159, 73.014660),
  LatLng(26.278406, 73.014710),
  LatLng(26.276904, 73.014584),
  LatLng(26.276267, 73.014463),
  LatLng(26.274727, 73.014298),
  LatLng(26.274051, 73.012296),
  LatLng(26.274384, 73.013256),
  LatLng(26.274412, 73.013241),
  LatLng(26.274051, 73.012218),
  LatLng(26.272133, 73.010498),
  LatLng(26.270702, 73.010080),
  LatLng(26.26960379056617, 73.01720816522602),
  LatLng(26.268992, 73.018587),
  LatLng(26.26779729378444, 73.01847895076243),
  LatLng(26.262013, 73.017793),
  LatLng(26.255401, 73.016812),
  LatLng(26.248189, 73.015831),
  LatLng(26.243783, 73.015139),
  LatLng(26.238595, 73.014448),
  LatLng(26.236133213319874, 73.01325149148408),
  LatLng(26.237621211586017, 73.00879421008595),
  LatLng(26.22672272643937, 73.00750777559384),
  LatLng(26.226769, 73.007686)
];

const List route3Stops = [
  "Nai Sarak",
  "Railway Station",
  "Jalori gate",
  "Nehru park",
  "rotary circle",
  "Riktiya Bheruyi circle",
  "JNVU",
  "Krishi mandi",
  "Basni KK colony",
  "Rameshwar Nagar",
  "Kudi housing board sector 5"
];

// Mondore to CHB
const List<LatLng> route4 = [];

const List route4Stops = [
  "Manore",
  "Kishor bag",
  "krishi mandi",
  "Bhadwasiya fatak",
  " Maha mamdir",
  "Paota circle",
  "Nai sarak",
  "Railway Station",
  "Jalori gate",
  "5th road",
  "Bombay motors",
  "Akhliya circle",
  "Chaupasni housing board"
];
