@extends('layouts.app')

@section('title', 'Edit Book')

@section('content')
<div class="container mt-5">
    <h2>Edit Book</h2>
    
    @if(session('success'))
        <div class="alert alert-success">
            {{ session('success') }}
        </div>
    @endif
    
    @if($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form action="{{ route('books.updateTwo', $book->id) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PATCH')
        <div class="form-group">
            <label for="name">Book Name:</label>
            <input type="text" class="form-control" id="name" name="name" value="{{ $book->name }}" required>
        </div>
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" class="form-control" id="price" name="price" value="{{ $book->price }}" required>
        </div>
        <div class="form-group">
            <label for="quantity">Quantity:</label>
            <input type="number" class="form-control" id="quantity" name="quantity" value="{{ $book->quantity }}" required>
        </div>
        <div class="form-group">
            <label for="image">Image:</label>
            <input type="file" class="form-control" id="image" name="image"> <!-- Remove value attribute for file input -->
            @if ($book->image)
                <img src="{{ asset($book->image) }}" alt="{{ $book->name }}" style="max-width: 200px; margin-top: 10px;"> <!-- Display existing image -->
            @endif
        </div>
        <div class="form-group">
            <label for="std">Standard:</label>
            
            <select class="form-control" id="Std" name="Std" required>
                <option value="">Select Standard</option>
                @for ($i = 1; $i <= 12; $i++)
                    <option value="std-{{ $i }}" {{ $book->Std == 'std-' . $i ? 'selected' : '' }}>Std-{{ $i }}</option>
                @endfor
            </select>
        </div>
        <button type="submit" class="btn btn-primary mt-3">Update Book</button>
    </form>
</div>
@endsection
