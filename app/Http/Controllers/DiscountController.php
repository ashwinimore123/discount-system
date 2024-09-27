<?php

namespace App\Http\Controllers;

use App\Services\DiscountService;
use App\Models\Discount;

use Illuminate\Http\Request;

class DiscountController extends Controller
{
    protected $discountService;

    public function __construct(DiscountService $discountService)
    {
        $this->discountService = $discountService;
    }

     public function index()
    {
        $discounts = Discount::all();

        return view('discounts.index', compact('discounts'));
    }

    public function applyDiscount(Request $request)
    {
        $user = $request->user();  // Assume user is authenticated
        $scheduleId = $request->input('schedule_id');
        $forFamilyMember = $request->input('for_family_member', false);

        $discount = $this->discountService->applyDiscounts($user, $scheduleId, $forFamilyMember);

        return response()->json([
            'discount' => $discount,
        ]);
    }
}
