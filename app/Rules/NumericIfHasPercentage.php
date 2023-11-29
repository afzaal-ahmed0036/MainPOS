<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;

class NumericIfHasPercentage implements Rule
{
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        // dd('here');
        // Get the value of 'has_percentage' from the request data
        $hasPercentage = request()->has('Percentage');
        // dd($hasPercentage);
        // dd($value);

        // If 'has_percentage' is equal to 1, then check if the value is numeric
        if ($hasPercentage == true) {
            return $value !== null && is_numeric($value);
        }

        // If 'has_percentage' is not equal to 1, the rule passes (considered valid)
        return true;
    }

    public function message()
    {
        return 'The :attribute is required and  must be numeric when Taxable is set to Yes.';
    }
}
