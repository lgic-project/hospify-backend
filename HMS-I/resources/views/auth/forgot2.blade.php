@component('mail::message')
# Reset Password

Click the following link to reset your password:

@component('mail::button', ['url' => url('password/reset', $user->remember_token)])
Reset Password
@endcomponent

Thanks,<br>
{{ config('app.name') }}
@endcomponent
