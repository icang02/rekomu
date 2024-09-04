<?php

use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\DB;

function formatRupiah($amount)
{
  return 'Rp ' . number_format($amount, 0, ',', '.');
}

function generateSlug($string)
{
  $uuid = substr(hash('sha256', str()->uuid()), 0, 6);
  return str()->slug($string) .  '-' . $uuid;
}

function generateCodeTransaction($date)
{
  $year = $date->format('Y');
  $month = $date->format('m');
  $day = $date->format('d');

  $random6Digits = str_pad(rand(0, 9999), 4, '0', STR_PAD_LEFT);
  $id = "trx-" . $year . $month . $day . $random6Digits;

  return $id;
}
  
// function paginateRawQuery($query, $perPage = 15)
// {
//   // Mendapatkan halaman saat ini dari query string (default: 1)
//   $currentPage = Paginator::resolveCurrentPage();

//   // Menghitung offset dan limit
//   $offset = ($currentPage - 1) * $perPage;

//   // Mengambil query SQL dan parameter binding
//   $sql = $query[0];
//   $bindings = $query[1] ?? [];

//   // Query untuk menghitung total item
//   $sqlForTotal = "SELECT COUNT(*) as total FROM (" . $sql . ") as subquery";
//   // dd($sqlForTotal);
//   $total = DB::select($sqlForTotal, $bindings)[0]->total;

//   // Tambahkan LIMIT dan OFFSET langsung menggunakan named bindings
//   $sqlForResults = $sql . " LIMIT :limit OFFSET :offset";

//   // Tambahkan nilai bindings untuk limit dan offset
//   $bindings['limit'] = $perPage;
//   $bindings['offset'] = $offset;

//   // Jalankan query untuk mendapatkan hasil paginasi
//   $results = DB::select($sqlForResults, $bindings);

//   // Membuat paginator
//   return new LengthAwarePaginator(
//     $results,
//     $total,
//     $perPage,
//     $currentPage,
//     ['path' => Paginator::resolveCurrentPath()]
//   );
// }
