<?php

namespace Database\Factories;

use App\Models\Booking;
use Illuminate\Database\Eloquent\Factories\Factory;

class BookingFactory extends Factory
{
    protected $model = Booking::class;

    public function definition()
    {
        return [
            'user_id' => \App\Models\User::factory(),
            'schedule_id' => \App\Models\Schedule::factory(),
            'for_family_member' => $this->faker->boolean(),
            'cost' => $this->faker->randomFloat(2, 50, 500),
        ];
    }
}
