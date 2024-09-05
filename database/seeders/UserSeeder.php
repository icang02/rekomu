<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
  /**
   * Run the database seeds.
   */
  public function run(): void
  {
    $dataUsers = [
      // DATA AKUN ADMIN
      [
        'name'     => 'Admin',
        'email'    => 'admin',
        'password' => bcrypt('admin'),
        'image'   => 'user/admin.jpg',
        'group_id' => 1,
      ],

      // DATA AKUN UMKM
      [
        'name'     => 'Manikku',
        'email'    => 'manikku@gmail.com',
        'password' => bcrypt('manikku'),
        'image'   => 'user/manikku.jpg',
        'group_id' => 3,
      ],
      [
        'name'     => 'Bracelet Kolaka',
        'email'    => 'braceletklk@gmail.com',
        'password' => bcrypt('braceletklk'),
        'image'   => 'user/braceletklk.png',
        'group_id' => 3,
      ],
      [
        'name'     => 'Rumah Tenun',
        'email'    => 'rumahtenun@gmail.com',
        'password' => bcrypt('rumahtenun'),
        'image'   => 'user/rumah_tenun.jpg',
        'group_id' => 3,
      ],
      [
        'name'     => 'Hello Gumpy',
        'email'    => 'hellogumpy@gmail.com',
        'password' => bcrypt('hellogumpy'),
        'image'   => 'user/gumpy.jpg',
        'group_id' => 3,
      ],
      [
        'name'     => 'Bracelet By Naral',
        'email'    => 'naralshop@gmail.com',
        'password' => bcrypt('naralshop'),
        'image'   => 'user/Bracelet Naral.jpg',
        'group_id' => 3,
      ],
      [
        'name'     => 'Toko Kopi Pakde',
        'email'    => 'tokokopipakde@gmail.com',
        'password' => bcrypt('tokokopipakde'),
        'image'   => 'user/kopipakde.jpg',
        'group_id' => 3,
      ],

      [
        'name'     => 'Mamina Booth',
        'email'    => 'maminabooth@gmail.com',
        'password' => bcrypt('maminabooth'),
        'image'   => 'user/Mamina Booth.jpg',
        'group_id' => 3,
      ],
      [
        'name'     => 'Kedai Senja',
        'email'    => 'kedaisenja@gmail.com',
        'password' => bcrypt('kedaisenja'),
        'image'   => 'user/Kedai Senja.jpg',
        'group_id' => 3,
      ],
      [
        'name'     => 'Kedai Barokah',
        'email'    => 'kedaibarokah@gmail.com',
        'password' => bcrypt('kedaibarokah'),
        'image'   => 'user/Kedai Barokah.jpg',
        'group_id' => 3,
      ],
      [
        'name'     => 'Kedai Yustia',
        'email'    => 'kedaiyustia@gmail.com',
        'password' => bcrypt('kedaiyustia'),
        'image'   => 'user/Kedai Yustia.jpg',
        'group_id' => 3,
      ],
      [
        'name'     => 'Angkringan Mante',
        'email'    => 'angkringanmante@gmail.com',
        'password' => bcrypt('angkringanmante'),
        'image'   => 'user/Angkringan Mante.jpg',
        'group_id' => 3,
      ],
      [
        'name'     => 'Cafe Kelapa Dua',
        'email'    => 'cafekelapadua@gmail.com',
        'password' => bcrypt('cafekelapadua'),
        'image'   => 'user/Kelapa Dua.jpg',
        'group_id' => 3,
      ],
      [
        'name'     => 'Edd Cemilan',
        'email'    => 'eddcemilankolaka@gmail.com',
        'password' => bcrypt('eddcemilankolaka'),
        'image'   => 'user/edd cemilan.jpg',
        'group_id' => 3,
      ],
      [
        'name'     => 'Dofu Donuts',
        'email'    => 'dofudonuts@gmail.com',
        'password' => bcrypt('dofudonuts'),
        'image'   => 'user/dofu donuts.jpg',
        'group_id' => 3,
      ],
      [
        'name'     => 'UO Kopi',
        'email'    => 'uokopi@gmail.com',
        'password' => bcrypt('uokopi'),
        'image'   => 'user/uo kopi.jpg',
        'group_id' => 3,
      ],
      [
        'name'     => 'Ummu Haura Kitchen',
        'email'    => 'ummuhaurakitchen@gmail.com',
        'password' => bcrypt('ummuhaurakitchen'),
        'image'   => 'user/ummu haura.jpg',
        'group_id' => 3,
      ],
      [
        'name'     => 'My Coffee Cafe',
        'email'    => 'mycoffee@gmail.com',
        'password' => bcrypt('mycoffee'),
        'image'   => 'user/my coffee cafe.jpg',
        'group_id' => 3,
      ],
      [
        'name'     => 'Coffe Story',
        'email'    => 'coffestory@gmail.com',
        'password' => bcrypt('coffestory'),
        'image'   => 'user/coffe story.jpg',
        'group_id' => 3,
      ],
      [
        'name'     => 'RM Asap',
        'email'    => 'rmasap@gmail.com',
        'password' => bcrypt('rmasap'),
        'image'   => 'user/rm asap.jpg',
        'group_id' => 3,
      ],
      [
        'name'     => 'Hijab Store',
        'email'    => 'hijabstore@gmail.com',
        'password' => bcrypt('hijabstore'),
        'image'   => 'user/hijab store.jpg',
        'group_id' => 3,
      ],
      [
        'name'     => 'Ayy Shop',
        'email'    => 'ayyshop@gmail.com',
        'password' => bcrypt('ayyshop'),
        'image'   => 'user/ayy shop.jpg',
        'group_id' => 3,
      ],
      [
        'name'     => 'Barira Butik',
        'email'    => 'barirabutik@gmail.com',
        'password' => bcrypt('barirabutik'),
        'image'   => 'user/barira butik.jpg',
        'group_id' => 3,
      ],
      [
        'name'     => 'Bahira Store',
        'email'    => 'bahirastore@gmail.com',
        'password' => bcrypt('bahirastore'),
        'image'   => 'user/bahira store.jpg',
        'group_id' => 3,
      ],

      // DATA AKUN USER
      [
        'name'     => 'Ila',
        'email'    => 'bandukarmila@yahoo.com',
        'password' => bcrypt('bandukarmila'),
        'image'   => null,
        'group_id' => 2,
      ],
      [
        'name'     => 'Riska Novianty',
        'email'    => 'riskanovianty95@gmail.com',
        'password' => bcrypt('riskanovianty95'),
        'image'   => null,
        'group_id' => 2,
      ],
      [
        'name'     => 'Nurhidayanti',
        'email'    => 'nurhidayanti98@gmail.com',
        'password' => bcrypt('nurhidayanti98'),
        'image'   => null,
        'group_id' => 2,
      ],
      [
        'name'     => 'Sarnita',
        'email'    => 'sarnitaaprilia@gmail.com',
        'password' => bcrypt('sarnitaaprilia'),
        'image'   => null,
        'group_id' => 2,
      ],
      [
        'name'     => 'Pasha Diza Putri',
        'email'    => 'pashadiza@gmail.com',
        'password' => bcrypt('pashadiza'),
        'image'   => null,
        'group_id' => 2,
      ],
      [
        'name'     => 'Risma Damayanti',
        'email'    => 'rismadamayanti2912@gmail.com',
        'password' => bcrypt('rismadamayanti2912'),
        'image'   => null,
        'group_id' => 2,
      ],
      [
        'name'     => 'Renaldi',
        'email'    => 'renaldi700302@gmail.com',
        'password' => bcrypt('renaldi700302'),
        'image'   => null,
        'group_id' => 2,
      ],
      [
        'name'     => "La ode muh. TaufiqQur'Rahman O.T.",
        'email'    => 'Kiong.y.143@gmail.com',
        'password' => bcrypt('Kiong.y.143'),
        'image'   => null,
        'group_id' => 2,
      ],
      [
        'name'     => "Hajria",
        'email'    => 'Haje@gmail.com',
        'password' => bcrypt('Haje'),
        'image'   => null,
        'group_id' => 2,
      ],
      [
        'name'     => 'Ummyy',
        'email'    => 'ummyyklsm14@gmail.com',
        'password' => bcrypt('ummyyklsm14'),
        'image'   => null,
        'group_id' => 2,
      ],
      [
        'name'     => 'Arya Wibawa AR',
        'email'    => 'aryawibawa352@gmail.com',
        'password' => bcrypt('aryawibawa352'),
        'image'   => null,
        'group_id' => 2,
      ],
      [
        'name'     => 'Ayudha Rahma Salam',
        'email'    => 'ayudharahma02@gmail.com',
        'password' => bcrypt('ayudharahma02'),
        'image'   => null,
        'group_id' => 2,
      ],
      [
        'name'     => 'Yasmin',
        'email'    => 'yasminwildani234@gmail.com',
        'password' => bcrypt('yasminwildani234'),
        'image'   => null,
        'group_id' => 2,
      ],
      [
        'name'     => 'Nur sadilah',
        'email'    => 'nursaadillah16@gmail.com',
        'password' => bcrypt('nursaadillah16'),
        'image'   => null,
        'group_id' => 2,
      ],
      [
        'name'     => 'Nurhandayani',
        'email'    => 'nurhandayaniamir74@gmail.com',
        'password' => bcrypt('nurhandayaniamir74'),
        'image'   => null,
        'group_id' => 2,
      ],
      [
        'name'     => 'Alexander skevin frandito amantokan nasus',
        'email'    => 'alexandernasus30@gmail.com',
        'password' => bcrypt('alexandernasus30'),
        'image'   => null,
        'group_id' => 2,
      ],
      [
        'name'     => 'Fenny Utami',
        'email'    => 'utamifenny3@gmail.com',
        'password' => bcrypt('utamifenny3'),
        'image'   => null,
        'group_id' => 2,
      ],
      [
        'name'     => 'Aqeela',
        'email'    => 'caaqila7@gmail.com',
        'password' => bcrypt('caaqila7'),
        'image'   => null,
        'group_id' => 2,
      ],
      [
        'name'     => 'Diaz ahza',
        'email'    => 'Diazahza0305@gmail.com',
        'password' => bcrypt('Diazahza0305'),
        'image'   => null,
        'group_id' => 2,
      ],
      [
        'name'     => 'Whyn',
        'email'    => 'herdiansyahwin5@gmail.com',
        'password' => bcrypt('herdiansyahwin5'),
        'image'   => null,
        'group_id' => 2,
      ],
      [
        'name'     => 'Romie Thomas ningrat',
        'email'    => 'Romie123@gmail.com',
        'password' => bcrypt('Romie123'),
        'image'   => null,
        'group_id' => 2,
      ],
      [
        'name'     => 'Indo Kulau',
        'email'    => 'indokulau0411@gmail.com',
        'password' => bcrypt('indokulau0411'),
        'image'   => null,
        'group_id' => 2,
      ],
      [
        'name'     => 'Vincent',
        'email'    => 'vincent231@gmail.com',
        'password' => bcrypt('vincent231'),
        'image'   => null,
        'group_id' => 2,
      ],
      [
        'name'     => 'Muhammad Al-Musyafir Kasim',
        'email'    => 'muh.almusyafir@gmail.com',
        'password' => bcrypt('muh.almusyafir'),
        'image'   => null,
        'group_id' => 2,
      ],
      [
        'name'     => 'Nur Atika Resky',
        'email'    => 'nuratikatika2002@gmail.com',
        'password' => bcrypt('nuratikatika2002'),
        'image'   => null,
        'group_id' => 2,
      ],
      [
        'name'     => 'Nurul Fadhilah Ashar',
        'email'    => 'nurulfadhilahashar@gmail.com',
        'password' => bcrypt('nurulfadhilahashar'),
        'image'   => null,
        'group_id' => 2,
      ],

    ];

    User::insert($dataUsers);
  }
}
