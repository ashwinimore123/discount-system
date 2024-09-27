<?php

namespace Tests\Unit;

use App\Models\User;  // Ensure User model is imported
use App\Services\DiscountService;
use Tests\TestCase;

class DiscountServiceTest extends TestCase
{
   public function testFamilyDiscount()
{
    $discountService = new DiscountService();

    // Create a user using a factory
    $user = \App\Models\User::factory()->create();

    // Create a schedule using a factory
    $schedule = \App\Models\Schedule::factory()->create();

    // Create a booking for a family member
    \App\Models\Booking::factory()->create([
        'user_id' => $user->id,
        'schedule_id' => $schedule->id,
        'for_family_member' => true,
    ]);

    // Create the discount in the database
    \App\Models\Discount::create([
        'name' => 'Family Member Discount',
        'type' => 'percentage',
        'value' => 10,
    ]);

    // Apply the discount
    $discount = $discountService->applyDiscounts($user, $schedule->id);

    // Assert the discount is greater than 0
    $this->assertGreaterThan(0, $discount);
}

}
