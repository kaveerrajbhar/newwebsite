<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
// use App\Models\Book; // Make sure to import your Book model
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

// class ProductController extends Controller
// {
//     public function create()
//     {
//         return view('books.create');
//     }

//     public function createbooks(Request $request)
// {
    // Validate the form data
    // $request->validate([
    //     'Bname' => 'required|string|max:255',
    //     'price' => 'required|numeric',
    //     'image' => 'required|image',
    //     'quantity' => 'required|integer',
    //     'Std' => 'required|string',
    // ]);

    // try {
        // Initialize the $imageName variable
        // $imageName = null;

        // Handle file upload
        // if ($request->hasFile('image')) {
        //     $image = $request->file('image');
        //     $imageName = time() . '_' . $image->getClientOriginalName();
        //     $image->move(public_path('images'), $imageName);
        // }

        // Save book information to database
//         DB::table('books')->insert([
//             'name' => $request->Bname,
//             'price' => $request->price,
//             'image' => $request->image,
//             'quantity' => $request->quantity,
//             'std' => $request->Std,
//         ]);

//         return redirect()->route('books.create')->with('success', 'Book information saved successfully.');
//     } catch (\Exception $e) {
//         Log::error('Database error: ' . $e->getMessage());

//         return back()->withInput()->withErrors('Database error: ' . $e->getMessage());
//     }
// }


    // Implement other methods like edit, update, delete as per your requirement
// }


class ProductController extends Controller
{
    public function create()
    {
        return view('books');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'Bname' => 'required|string|max:255',
            'price' => 'required|numeric',
            'image' => 'required|image',
            'quantity' => 'required|integer',
            'Std' => 'required|string',
        ]);

        $book = new Book;
        $book->Bname = $validated['Bname'];
        $book->price = $validated['price'];
        $book->image = $request->file('image')->store('images', 'public');
        $book->quantity = $validated['quantity'];
        $book->Std = $validated['Std'];
        $book->save();

        return redirect()->route('books.create')->with('success', 'Book added successfully');
    }
}