@extends('layouts.app')

@section('title', 'Book List')

@section('content')
<div class="container mt-4">
    <h1>Book List</h1>

    <div class="row mt-4 mb-3">
        <div class="col-md-6">
            <form id="filterForm">
                <div class="form-group mr-2">
                    <label for="searchStd" class="mr-2">Filter by Std:</label>
                    <select class="form-control" id="searchStd" name="std">
                        <option value="">All Standards</option>
                        @for ($i = 1; $i <= 12; $i++)
                            <option value="std-{{ $i }}">Std-{{ $i }}</option>
                        @endfor
                    </select>
                </div>
                <div class="form-group mr-2">
                    <label for="searchName" class="mr-2">Search by Name:</label>
                    <input type="text" class="form-control" id="searchName" name="name" placeholder="Enter book name">
                </div>
                <button type="submit" class="btn btn-primary">Search</button>
            </form>
        </div>
    </div>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Standard</th>
                <th>Image</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($books as $book)
            <tr id="bookRow{{ $book->id }}">
                <td>{{ $book->name }}</td>
                <td>{{ $book->price }}</td>
                <td>{{ $book->quantity }}</td>
                <td>{{ $book->Std }}</td>
                <td>
                    <img src="{{ asset($book->image) }}" alt="{{ $book->name }}" class="img-thumbnail" width="100">
                </td>
                <td>
                    <a href="{{ route('books.edit', $book->id) }}" class="btn btn-warning">Edit</a>
                    <!-- Add other actions like Delete if needed -->
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection

@section('scripts')
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const filterForm = document.getElementById('filterForm');
        const bookRows = document.querySelectorAll('tbody tr');

        filterForm.addEventListener('submit', function(event) {
            event.preventDefault();

            const stdFilter = document.getElementById('searchStd').value;
            const nameFilter = document.getElementById('searchName').value.trim().toLowerCase();

            bookRows.forEach(function(row) {
                const stdColumn = row.querySelector('td:nth-child(4)').textContent.trim().toLowerCase();
                const nameColumn = row.querySelector('td:first-child').textContent.trim().toLowerCase();

                const stdMatch = stdFilter === '' || stdColumn === stdFilter.toLowerCase();
                const nameMatch = nameColumn.includes(nameFilter);

                if (stdMatch && nameMatch) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });

        // Initial filter on page load (optional)
        const stdFilter = document.getElementById('searchStd').value;
        const nameFilter = document.getElementById('searchName').value.trim().toLowerCase();

        bookRows.forEach(function(row) {
            const stdColumn = row.querySelector('td:nth-child(4)').textContent.trim().toLowerCase();
            const nameColumn = row.querySelector('td:first-child').textContent.trim().toLowerCase();

            const stdMatch = stdFilter === '' || stdColumn === stdFilter.toLowerCase();
            const nameMatch = nameColumn.includes(nameFilter);

            if (stdMatch && nameMatch) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    });
</script>
@endsection
