<!DOCTYPE html>
<html>
<head>
    <title>Discounts List</title>
</head>
<body>
    <h1>Available Discounts</h1>

    @if ($discounts->isEmpty())
        <p>No discounts available.</p>
    @else
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Value</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($discounts as $discount)
                    <tr>
                        <td>{{ $discount->id }}</td>
                        <td>{{ $discount->name }}</td>
                        <td>{{ $discount->type }}</td>
                        <td>{{ $discount->value }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    @endif
</body>
</html>
