<?php

namespace App\Http\Controllers;

use App\Services\DiscountService;

class BookingController extends Controller
{
    protected $discountService;

    public function __construct(DiscountService $discountService)
    {
        $this->discountService = $discountService;
    }

    public function applyDiscounts($userId, $scheduleId)
    {
        $familyDiscount = $this->discountService->calculateFamilyMemberDiscount($userId, $scheduleId);
        $recurringDiscount = $this->discountService->calculateRecurringDiscount($userId, $scheduleId);

        // Apply the discounts to the booking cost
        $totalDiscount = $familyDiscount + $recurringDiscount;

        return response()->json(['total_discount' => $totalDiscount]);
    }
}
