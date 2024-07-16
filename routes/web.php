<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\StudentBookController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

<<<<<<< HEAD
Route::middleware(['web'])->group(function () {
=======

>>>>>>> e9a76d8df7b6d049e4b2774ee404977b779cff3e
Route::get('/students/search', [StudentController::class, 'search'])->name('students.search');
Route::get('/login', [AuthController::class, 'showLoginForm'])->name('login');
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

// routes/web.php

Route::get('/', [HomeController::class, 'index']);



// Form to create a new student
Route::get('/form', [StudentBookController::class, 'create'])->name('form.create');

// Store a new student
Route::post('/form/store', [StudentBookController::class, 'store'])->name('form.store');

// List all students
Route::get('/students', [StudentBookController::class, 'index'])->name('students.index');

// Form to edit a student
Route::get('/students/{id}/edit', [StudentBookController::class, 'edit'])->name('students.edit');

// Update a student
Route::put('/students/{id}', [StudentBookController::class, 'update'])->name('students.update');

// Delete a student
Route::delete('/students/{id}', [StudentBookController::class, 'destroy'])->name('students.destroy');

<<<<<<< HEAD

// Route to show the form for creating a book
Route::get('/books/create', [ProductController::class, 'create'])->name('books.create');

// Route to store a new book
Route::post('/books/store', [ProductController::class, 'store'])->name('books.store');


Route::get('/books/update', [ProductController::class, 'listBook'])->name('books.update');

// Custom route for editing a specific book
Route::get('books/{id}/edit', [ProductController::class, 'edit'])->name('books.edit');

Route::patch('books/{id}', [ProductController::class, 'updateTwo'])->name('books.updateTwo');


});

=======
//books Route
//  Route::any('/books/store', [ProductController::class, 'store'])->name('books.store');
//  Route::get('/books', [ProductController::class, 'create'])->name('books.create');


Route::any('/books/create', [ProductController::class, 'create'])->name('books.create');
Route::any('/books', [ProductController::class, 'store'])->name('books.store');
>>>>>>> e9a76d8df7b6d049e4b2774ee404977b779cff3e





 