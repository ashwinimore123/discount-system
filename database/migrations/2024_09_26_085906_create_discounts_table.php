<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
{
    Schema::create('discounts', function (Blueprint $table) {
        $table->id();
        $table->string('name');
        $table->enum('type', ['amount', 'percentage']);
        $table->decimal('value', 8, 2);
        $table->integer('max_uses')->default(0);
        $table->decimal('max_discount', 8, 2)->nullable();
        $table->boolean('family_member')->default(false);  // family member discount rule
        $table->timestamps();
    });
}


    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('discounts');
    }
};
