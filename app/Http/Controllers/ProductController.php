<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Book; // Import your Book model


class ProductController extends Controller
{
    public function create()
    {

        return view('books.create');
    }

    public function update()
    {
        return view('books.edit');

    }

    public function store(Request $request)
    {

        // Validate the incoming request data
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'price' => 'required|numeric',
            'quantity' => 'required|integer',
            'image' => 'required|image',
            'Std' => 'required|string',
        ]);

        try {
            // Generate a unique filename for the image
            $imageName = time() . '_' . $request->file('image')->getClientOriginalName();

            // Move the uploaded file to the desired directory
            $request->file('image')->move(public_path('books/' . $validated['Std']), $imageName);

            // Insert data using Laravel Query Builder
            DB::table('books')->insert([
                'name' => $validated['name'],
                'price' => $validated['price'],
                'quantity' => $validated['quantity'],
                'image' => 'books/' . $validated['Std'] . '/' . $imageName, // Store path relative to public directory
                'std' => $validated['Std'],
            ]);

            return redirect()->route('books.create')->with('success', 'Book added successfully');
        } catch (\Exception $e) {
            // Handle any database or file upload errors
            return back()->withInput()->withErrors('Failed to add book. ' . $e->getMessage());
        }
    }

    public function updateTwo(Request $request, $id)
{
    $validated = $request->validate([
        'name' => 'required|string|max:255',
        'price' => 'required|numeric',
        'quantity' => 'required|integer',
        'image' => 'sometimes|image',
        'Std' => 'required|string',
    ]);

    try {
        $book = DB::table('books')->where('id', $id)->first();
        if (!$book) {
            return back()->withErrors('Book not found.');
        }

        $data = [
            'name' => $validated['name'],
            'price' => $validated['price'],
            'quantity' => $validated['quantity'],
            'std' => $validated['Std'],
        ];

        if ($request->hasFile('image')) {
            $imageName = time() . '_' . $request->file('image')->getClientOriginalName();
            $request->file('image')->move(public_path('books/' . $validated['Std']), $imageName);
            $data['image'] = 'books/' . $validated['Std'] . '/' . $imageName;
        }

        DB::table('books')->where('id', $id)->update($data);

        return redirect()->route('books.edit', $id)->with('success', 'Book updated successfully');
    } catch (\Exception $e) {
        return back()->withInput()->withErrors('Failed to update book. ' . $e->getMessage());
    }
}


    public function listBook()
    {
        $books = Book::all(); // Retrieve all books
        
        $data = []; // Initialize an empty array to store data for each book
        
        foreach ($books as $book) {
            $data[] = [
                'id' => $book->id,
                'name' => $book->name,
                'price' => $book->price,
                'image' => $book->image,
            ];
        }
        
        return view('books.index', compact('books', 'data'));
    }

    public function edit($id)
    {
        $book = DB::table('books')->where('id', $id)->first();
    
        if ($book) {
            return view('books.edit', compact('book'));
        } else {
            return redirect()->route('books.update')->withErrors('Book not found.');
        }
    }
}

