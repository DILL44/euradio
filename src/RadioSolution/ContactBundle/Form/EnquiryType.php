<?php
namespace RadioSolution\ContactBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilder;
use EWZ\Bundle\RecaptchaBundle\Validator\Constraints\True;

class EnquiryType extends AbstractType
{
	public function buildForm(FormBuilder $builder, array $options)
	{
		$builder->add('name');
		$builder->add('email', 'email');
		$builder->add('subject');
		$builder->add('body', 'textarea');
		$builder->add('recaptcha', 'ewz_recaptcha');
	}

	public function getName()
	{
		return 'contact';
	}
}