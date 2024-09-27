# Discount Module

## Installation

1. Clone the repository.
2. Run `composer install`.
3. Configure the `.env` file with your database settings.
4. Run migrations: `php artisan migrate`.
5. Seed the database: `php artisan db:seed --class=DiscountSeeder`.
6. Serve the application: `php artisan serve`.

## Usage

- Family Member Discount: Applies a percentage discount if booking for a family member.
- Recurring Discount: Applies a discount if a user books the same schedule again.

## API

- Apply Discount: `POST /api/apply-discount`
  - Request body:
    ```json
    {
      "schedule_id": 1,
      "for_family_member": true
    }
    ```
  - Response:
    ```json
    {
      "discount": 20
    }
    ```

