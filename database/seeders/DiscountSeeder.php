<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;  // Add this line
use Illuminate\Support\Carbon;

class DiscountSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
{
    DB::table('discounts')->insert([
        [
            'name' => 'Family Member Discount',
            'type' => 'percentage',
            'value' => 10,
            'max_uses' => 5,
            'family_member' => true,
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now(),
        ],
        [
            'name' => 'Recurring Booking Discount',
            'type' => 'amount',
            'value' => 20,
            'max_uses' => 10,
            'family_member' => false, // Ensure all fields are provided, even if not used
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now(),
        ],
    ]);
}

}
