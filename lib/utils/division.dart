// const divisions1 = ref([
//     {
//         id: 1,
//         name: 'Dhaka',
//         districts: [
//             {
//                 name: 'Dhaka',
//                 subDistricts: ["Dhamrai", "Dohar", "Keraniganj", "Nawabganj", "Savar", "Tejgaon Circle"],

//             },
//             {
//                 name: 'Faridpur',
//                 subDistricts: ["Alfadanga", "Bhanga", "Boalmari", "Charbhadrasan", "Faridpur Sadar", "Madhukhali", "Nagarkanda", "Sadarpur", "Saltha"],
//             },
//             {
//                 name: 'Gazipur',
//                 subDistricts: ["Gazipur Sadar", "Kaliakair", "Kaliganj", "Kapasia", "Sreepur"],
//             },
//             {
//                 name: 'Gopalganj',
//                 subDistricts: ["Gopalganj Sadar", "Kashiani", "Kotalipara", "Muksudpur", "Tungipara"],
//             },
//             {
//                 name: 'Kishoreganj',
//                 subDistricts: ["Austagram", "Bajitpur", "Bhairab", "Hossainpur", "Itna", "Karimganj", "Katiadi", "Kishoreganj Sadar", "Kuliarchar", "Mithamain", "Nikli", "Pakundia"],
//             },
//             {
//                 name: 'Madaripur',
//                 subDistricts: ["Rajoir", "Madaripur Sadar", "Kalkini", "Shibchar"],
//             },
//             {
//                 name: 'Manikganj',
//                 subDistricts: ["Daulatpur", "Ghior", "Harirampur", "Manikgonj Sadar", "Saturia", "Shivalaya", "Singair"],
//             },
//             {
//                 name: 'Munshiganj',
//                 subDistricts: ["Gazaria", "Lohajang", "Munshiganj Sadar", "Sirajdikhan", "Sreenagar", "Tongibari"],
//             },
//             {
//                 name: 'Narayanganj',
//                 subDistricts: ["Araihazar", "Bandar", "Narayanganj Sadar", "Rupganj", "Sonargaon"],
//             },
//             {
//                 name: 'Narsingdi',
//                 subDistricts: ["Narsingdi Sadar", "Belabo", "Monohardi", "Palash", "Raipura", "Shibpur"],
//             },
//             {
//                 name: 'Rajbari',
//                 subDistricts: ["Baliakandi", "Goalandaghat", "Pangsha", "Rajbari Sadar", "Kalukhali"],
//             },
//             {
//                 name: 'Shariatpur',
//                 subDistricts: ["Bhedarganj", "Damudya", "Gosairhat", "Naria", "Shariatpur Sadar", "Zajira", "Shakhipur"],
//             },
//             {
//                 name: 'Tangail',
//                 subDistricts: ["Gopalpur", "Basail", "Bhuapur", "Delduar", "Ghatail", "Kalihati", "Madhupur", "Mirzapur", "Nagarpur", "Sakhipur", "Dhanbari", "Tangail Sadar"],
//             },

//         ]

//     },
//     {
//         id: 2,
//         name: 'Chattogram',
//         districts: [
//             {
//                 name: 'Bandarban',
//                 subDistricts: ["Ali Kadam", "Bandarban Sadar", "Lama", "Naikhongchhari", "Rowangchhari", "Ruma", "Thanchi"],
//             },
//             {
//                 name: 'Brahmanbaria',
//                 subDistricts: ["Akhaura", "Bancharampur", "Brahmanbaria Sadar", "Kasba", "Nabinagar", "Nasirnagar", "Sarail", "Ashuganj", "Bijoynagar"],
//             },
//             {
//                 name: 'Chandpur',
//                 subDistricts: ["Chandpur Sadar", "Faridganj", "Haimchar", "Haziganj", "Kachua", "Matlab Dakshin", "Matlab Uttar", "Shahrasti"],
//             },
//             {
//                 name: 'Chittagong',
//                 subDistricts: ["Anwara", "Banshkhali", "Boalkhali", "Chandanaish", "Fatikchhari", "Hathazari", "Karnaphuli", "Lohagara", "Mirsharai", "Patiya", "Rangunia", "Raozan", "Sandwip", "Satkania", "Sitakunda", "Bandar Thana", "Chandgaon Thana", "Double Mooring Thana", "Kotwali Thana", "Pahartali Thana", "Panchlaish Thana", "Bhujpur Thana"],
//             },
//             {
//                 name: 'Comilla',
//                 subDistricts: ["Barura", "Brahmanpara", "Burichang", "Chandina", "Chauddagram", "Daudkandi", "Debidwar", "Homna", "Laksam", "Muradnagar", "Nangalkot", "Cumilla Adarsha Sadar", "Meghna", "Titas", "Monohargonj", "Cumilla Sadar Dakshin"],
//             },
//             {
//                 name: "Cox's Bazar",
//                 subDistricts: ["Chakaria", "Cox's Bazar Sadar", "Kutubdia", "Maheshkhali", "Ramu", "Teknaf", "Ukhia", "Pekua"],
//             },
//             {
//                 name: "Feni",
//                 subDistricts: ["Chhagalnaiya", "Daganbhuiyan", "Feni Sadar", "Parshuram", "Sonagazi", "Fulgazi"],
//             },
//             {
//                 name: "Khagrachhari",
//                 subDistricts: ["Dighinala", "Khagrachhari", "Lakshmichhari", "Mahalchhari", "Manikchhari", "Matiranga", "Panchhari", "Ramgarh"],
//             },
//             {
//                 name: "Lakshmipur",
//                 subDistricts: ["Lakshmipur Sadar", "Raipur", "Ramganj", "Ramgati", "Kamalnagar"],
//             },
//             {
//                 name: "Noakhali",
//                 subDistricts: ["Begumganj", "Noakhali Sadar", "Chatkhil", "Companiganj", "Hatiya", "Senbagh", "Sonaimuri", "Subarnachar", "Kabirhat"],
//             },
//             {
//                 name: "Rangamati",
//                 subDistricts: ["Bagaichhari", "Barkal", "Kawkhali (Betbunia)", "Belaichhari", "Kaptai", "Juraichhari", "Langadu", "Naniyachar", "Rajasthali", "Rangamati Sadar"],
//             },
//         ],
//     },
//     {
//         id: 3,
//         name: 'Barisal',
//         districts: [
//             {
//                 name: 'Barguna',
//                 subDistricts: ["Amtali", "Bamna", "Barguna Sadar", "Betagi", "Patharghata", "Taltali"],
//             },
//             {
//                 name: 'Barisal',
//                 subDistricts: ["Agailjhara", "Babuganj", "Bakerganj", "Banaripara", "Gaurnadi", "Hizla", "Barishal Sadar", "Mehendiganj", "Muladi", "Wazirpur"],
//             },
//             {
//                 name: 'Bhola',
//                 subDistricts: ["Bhola Sadar", "Burhanuddin", "Char Fasson", "Daulatkhan", "Lalmohan", "Manpura", "Tazumuddin"],
//             },
//             {
//                 name: 'Jhalokati',
//                 subDistricts: ["Jhalokati Sadar", "Kathalia", "Nalchity", "Rajapur"],
//             },
//             {
//                 name: 'Patuakhali',
//                 subDistricts: ["Bauphal", "Dashmina", "Galachipa", "Kalapara", "Mirzaganj", "Patuakhali Sadar", "Rangabali", "Dumki"],
//             },
//             {
//                 name: "Pirojpur",
//                 subDistricts: ["Bhandaria", "Kawkhali", "Mathbaria", "Nazirpur", "Pirojpur Sadar", "Nesarabad (Swarupkati)", "Zianagar"],
//             },
//         ],
//     },
//     {
//         id: 4,
//         name: 'Khulna',
//         districts: [
//             {
//                 name: 'Bagerhat',
//                 subDistricts: ["Bagerhat Sadar", "Chitalmari", "Fakirhat", "Kachua", "Mollahat", "Mongla", "Morrelganj", "Rampal", "Sarankhola"],
//             },
//             {
//                 name: 'Chuadanga',
//                 subDistricts: ["Alamdanga", "Chuadanga Sadar", "Damurhuda", "Jibannagar"],
//             },
//             {
//                 name: 'Jessore',
//                 subDistricts: ["Abhaynagar", "Bagherpara", "Chaugachha", "Jhikargachha", "Keshabpur", "Jashore Sadar", "Manirampur", "Sharsha"],
//             },
//             {
//                 name: 'Jhenaidah',
//                 subDistricts: ["Harinakunda", "Jhenaidah Sadar", "Kaliganj", "Kotchandpur", "Maheshpur", "Shailkupa"],
//             },
//             {
//                 name: 'Khulna',
//                 subDistricts: ["Batiaghata", "Dacope", "Dumuria", "Dighalia", "Koyra", "Paikgachha", "Phultala", "Rupsha", "Terokhada", "Daulatpur Thana", "Khalishpur Thana", "Khan Jahan Ali Thana", "Kotwali Thana", "Sonadanga Thana", "Harintana Thana"],
//             },
//             {
//                 name: "Kushtia",
//                 subDistricts: ["Bheramara", "Daulatpur", "Khoksa", "Kumarkhali", "Kushtia Sadar", "Mirpur"],
//             },
//             {
//                 name: "Magura",
//                 subDistricts: ["Magura Sadar", "Mohammadpur", "Shalikha", "Sreepur"],
//             },
//             {
//                 name: "Meherpur",
//                 subDistricts: ["Gangni", "Meherpur Sadar", "Mujibnagar"],
//             },
//             {
//                 name: "Narail",
//                 subDistricts: ["Kalia", "Lohagara", "Narail Sadar", "Naragati Thana"],
//             },
//             {
//                 name: "Satkhira",
//                 subDistricts: ["Assasuni", "Debhata", "Kalaroa", "Kaliganj", "Satkhira Sadar", "Shyamnagar", "Tala"],
//             },
//         ],
//     },
//     {
//         id: 5,
//         name: 'Mymensingh',
//         districts: [
//             {
//                 name: 'Jamalpur',
//                 subDistricts: ["Baksiganj", "Dewanganj", "Islampur", "Jamalpur Sadar", "Madarganj", "Melandaha", "Sarishabari"],
//             },
//             {
//                 name: 'Mymensingh',
//                 subDistricts: ["Trishal", "Dhobaura", "Fulbaria", "Gaffargaon", "Gauripur", "Haluaghat", "Ishwarganj", "Mymensingh Sadar", "Muktagachha", "Nandail", "Phulpur", "Bhaluka", "Tara Khanda"],
//             },
//             {
//                 name: 'Netrakona',
//                 subDistricts: ["Atpara", "Barhatta", "Durgapur", "Khaliajuri", "Kalmakanda", "Kendua", "Madan", "Mohanganj", "Netrokona Sadar", "Purbadhala"],
//             },
//             {
//                 name: 'Sherpur',
//                 subDistricts: ["Jhenaigati", "Nakla", "Nalitabari", "Sherpur Sadar", "Sreebardi"],
//             },
//         ],
//     },
//     {
//         id: 6,
//         name: 'Rajshahi',
//         districts: [
//             {
//                 name: 'Bogra',
//                 subDistricts: ["Adamdighi", "Bogura Sadar", "Dhunat", "Dhupchanchia", "Gabtali", "Kahaloo", "Nandigram", "Sariakandi", "Shajahanpur", "Sherpur", "Shibganj", "Sonatola"],
//             },
//             {
//                 name: 'Chapainawabganj',
//                 subDistricts: ["Bholahat", "Gomastapur", "Nachole", "Nawabganj Sadar", "Shibganj"],
//             },
//             {
//                 name: 'Joypurhat',
//                 subDistricts: ["Akkelpur", "Joypurhat Sadar", "Kalai", "Khetlal", "Panchbibi"],
//             },
//             {
//                 name: 'Naogaon',
//                 subDistricts: ["Atrai", "Badalgachhi", "Manda", "Dhamoirhat", "Mohadevpur", "Naogaon Sadar", "Niamatpur", "Patnitala", "Porsha", "Raninagar", "Sapahar"],
//             },
//             {
//                 name: 'Natore',
//                 subDistricts: ["Bagatipara", "Baraigram", "Gurudaspur", "Lalpur", "Natore Sadar", "Singra", "Naldanga"],
//             },
//             {
//                 name: 'Pabna',
//                 subDistricts: ["Atgharia", "Bera", "Bhangura", "Chatmohar", "Faridpur", "Ishwardi", "Pabna Sadar", "Santhia", "Sujanagar"],
//             },
//             {
//                 name: 'Rajshahi',
//                 subDistricts: ["Bagha", "Bagmara", "Charghat", "Durgapur", "Godagari", "Mohanpur", "Paba", "Puthia", "Tanore"],
//             },
//             {
//                 name: 'Sirajganj',
//                 subDistricts: ["Belkuchi", "Chauhali", "Kamarkhanda", "Kazipur", "Raiganj", "Shahjadpur", "Sirajganj Sadar", "Tarash", "Ullahpara"],
//             },
//         ],
//     },
//     {
//         id: 7,
//         name: 'Rangpur',
//         districts: [
//             {
//                 name: 'Dinajpur',
//                 subDistricts: ["Birampur", "Birganj", "Biral", "Bochaganj", "Chirirbandar", "Phulbari", "Ghoraghat", "Hakimpur", "Kaharole", "Khansama", "Dinajpur Sadar", "Nawabganj", "Parbatipur"],
//             },
//             {
//                 name: 'Gaibandha',
//                 subDistricts: ["Phulchhari", "Gaibandha Sadar", "Gobindaganj", "Palashbari", "Sadullapur", "Sughatta", "Sundarganj"],
//             },
//             {
//                 name: 'Kurigram',
//                 subDistricts: ["Bhurungamari", "Char Rajibpur", "Chilmari", "Phulbari", "Kurigram Sadar", "Nageshwari", "Rajarhat", "Raomari", "Ulipur"],
//             },
//             {
//                 name: 'Lalmonirhat',
//                 subDistricts: ["Aditmari", "Hatibandha", "Kaliganj", "Lalmonirhat Sadar", "Patgram"],
//             },
//             {
//                 name: 'Nilphamari',
//                 subDistricts: ["Dimla", "Domar", "Jaldhaka", "Kishoreganj", "Nilphamari Sadar", "Saidpur"],
//             },
//             {
//                 name: 'Panchagarh',
//                 subDistricts: ["Atwari", "Boda", "Debiganj", "Panchagarh Sadar", "Tetulia"],
//             },
//             {
//                 name: 'Rangpur',
//                 subDistricts: ["Badarganj", "Gangachhara", "Kaunia", "Rangpur Sadar", "Mithapukur", "Pirgachha", "Pirganj", "Taraganj"],
//             },
//             {
//                 name: 'Thakurgaon',
//                 subDistricts: ["Baliadangi", "Haripur", "Pirganj", "Ranisankail", "Thakurgaon Sadar"],
//             },
//         ],
//     },
//     {
//         id: 8,
//         name: 'Rangpur',
//         districts: [
//             {
//                 name: 'Habiganj',
//                 subDistricts: ["Ajmiriganj", "Bahubal", "Baniyachong", "Chunarughat", "Habiganj Sadar", "Lakhai", "Madhabpur", "Nabiganj", "Sayestaganj"],
//             },
//             {
//                 name: 'Moulvibazar',
//                 subDistricts: ["Barlekha", "Juri", "Kamalganj", "Kulaura", "Moulvibazar Sadar", "Rajnagar", "Sreemangal"],
//             },
//             {
//                 name: 'Sunamganj',
//                 subDistricts: ["Bishwamvarpur", "Chhatak", "Dakshin Sunamganj", "Derai", "Dharamapasha", "Dowarabazar", "Jagannathpur", "Jamalganj", "Sullah", "Sunamganj Sadar", "Tahirpur"],
//             },
//             {
//                 name: 'Sylhet',
//                 subDistricts: ["Balaganj", "Beanibazar", "Bishwanath", "Companigonj", "Dakshin Surma", "Fenchuganj", "Golapganj", "Gowainghat", "Jaintiapur", "Kanaighat", "Osmani Nagar", "Sylhet Sadar", "Zakiganj"]
//             },
//         ],
//     },
// ]);