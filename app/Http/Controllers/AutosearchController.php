<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AutosearchController extends Controller
{
    public function autosearch(Request $request)
    {
        if ($request->ajax()) {
            $data = DB::table('products')->where('name', 'LIKE', $request->name . '%')->get();
            $output = '';
            if (count($data) > 0) {
                $output = '<ul class="list-group" style="display: block; position: relative; z-index: 1; overflow:scroll; height:250px;">';
                foreach ($data as $row) {
                    $output .= '<li class="list-group-item">' . $row->name . '</li>';
                }
                $output .= '</ul>';
            } else {
                $output .= '<li class="list-group-item">' . 'No Data Found' . '</li>';
            }
            return $output;
        }
        return view('purchase.k');
    }
    public  function kashif()
    {
        return view('purchase.kk');
    }
}
