<?php

namespace App\Mail;
use App\Models\User;
use Illuminate\Support\Facades\Log;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class ForgotPassword extends Mailable
{
    use Queueable, SerializesModels;
    public $formdata;

    /**
     * Create a new message instance.
     */
    public function __construct(array $formdata)
    {
        $this->formdata = $formdata;
        log::info('Forgot password email sent', [$formdata]);
    }

    /**
     * Get the message envelope.
     */
    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Forgot Password',
        );
    }

    /**
     * Get the message content definition.
     */
    public function build()
{log::info('iam inside build', [$this->formdata]);
    return $this->markdown('auth.forgot')
                ->with(['user' => $this->formdata]);
                
}

    /**
     * Get the attachments for the message.
     *
     * @return array<int, \Illuminate\Mail\Mailables\Attachment>
     */
    public function attachments(): array
    {
        return [];
    }
}
