<?php

namespace App\Services;

use App\Models\Booking;  // Import the Booking model
use App\Models\Discount;
use Carbon\Carbon;

class DiscountService
{
public function applyDiscounts($user, $scheduleId, $isForFamilyMember = false)
{
    $totalDiscount = 0;

    // Family Member Discount Logic
    $hasFamilyMemberBooked = Booking::where('user_id', $user->id)
        ->where('schedule_id', $scheduleId)
        ->where('for_family_member', true)
        ->exists();  // Directly use exists()

    // Debugging the condition
    dd($hasFamilyMemberBooked);

    if ($hasFamilyMemberBooked) {
        $familyDiscount = Discount::where('name', 'Family Member Discount')->first();

        if ($familyDiscount) {
            $totalDiscount += $this->calculateDiscount($familyDiscount);
        }
    }

    return $totalDiscount;
}



    private function calculateDiscount($discount)
    {
        // Example logic to calculate discount
        if ($discount->type == 'percentage') {
            return $discount->value / 100;
        }

        return $discount->value;
    }
}
