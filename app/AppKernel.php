<?php

use Symfony\Component\HttpKernel\Kernel;
use Symfony\Component\Config\Loader\LoaderInterface;

class AppKernel extends Kernel
{
	public function registerBundles()
	{
		$bundles = array(
		new Symfony\Bundle\FrameworkBundle\FrameworkBundle(),
		new Symfony\Bundle\SecurityBundle\SecurityBundle(),
		new Symfony\Bundle\TwigBundle\TwigBundle(),
		new Symfony\Bundle\MonologBundle\MonologBundle(),
		new Symfony\Bundle\SwiftmailerBundle\SwiftmailerBundle(),
		new Symfony\Bundle\DoctrineBundle\DoctrineBundle(),
		new Symfony\Bundle\AsseticBundle\AsseticBundle(),
		new Sensio\Bundle\FrameworkExtraBundle\SensioFrameworkExtraBundle(),
		new JMS\SecurityExtraBundle\JMSSecurityExtraBundle(),

		new COil\ToolsBundle\ToolsBundle(),
		new Stfalcon\Bundle\TinymceBundle\StfalconTinymceBundle(),
		new EWZ\Bundle\RecaptchaBundle\EWZRecaptchaBundle(),
		new Wowo\NewsletterBundle\WowoNewsletterBundle(),
		new Wowo\QueueBundle\WowoQueueBundle(),
		new Ps\PdfBundle\PsPdfBundle(),
		new Eko\FeedBundle\EkoFeedBundle(),
		new Sensio\Bundle\BuzzBundle\SensioBuzzBundle(),
		new Gregwar\ImageBundle\GregwarImageBundle(),
		new Vich\GeographicalBundle\VichGeographicalBundle(),
		//new Sly\UrlShortenerBundle\SlyUrlShortenerBundle(),

		new Knp\Bundle\MenuBundle\KnpMenuBundle(),
		new Knp\Bundle\MarkdownBundle\KnpMarkdownBundle(),
		new Knp\Bundle\PaginatorBundle\KnpPaginatorBundle(),

		new FOS\UserBundle\FOSUserBundle(),
		new FOS\CommentBundle\FOSCommentBundle(),
		new FOS\FacebookBundle\FOSFacebookBundle(),
		new FOS\TwitterBundle\FOSTwitterBundle(),

		new Sonata\PageBundle\SonataPageBundle(),
		new Sonata\CacheBundle\SonataCacheBundle(),
		new Sonata\BlockBundle\SonataBlockBundle(),
		new Sonata\SeoBundle\SonataSeoBundle(),
		new Sonata\EasyExtendsBundle\SonataEasyExtendsBundle(),
		new Sonata\NotificationBundle\SonataNotificationBundle(),
		new Sonata\AdminBundle\SonataAdminBundle(),
		new Sonata\DoctrineORMAdminBundle\SonataDoctrineORMAdminBundle(),
		new Sonata\jQueryBundle\SonatajQueryBundle(),
		new Sonata\UserBundle\SonataUserBundle('FOSUserBundle'),
		new Sonata\FormatterBundle\SonataFormatterBundle(),
		new Sonata\MediaBundle\SonataMediaBundle(),
		new Sonata\NewsBundle\SonataNewsBundle(),

		new Application\Sonata\UserBundle\ApplicationSonataUserBundle(),
		new Application\Sonata\PageBundle\ApplicationSonataPageBundle(),
		new Application\Sonata\NewsBundle\ApplicationSonataNewsBundle(),
		new Application\Sonata\MediaBundle\ApplicationSonataMediaBundle(),
		new Application\Sonata\BlockBundle\ApplicationSonataBlockBundle()
		);

		if (in_array($this->getEnvironment(), array('dev', 'test'))) {
			$bundles[] = new Acme\DemoBundle\AcmeDemoBundle();
			$bundles[] = new Symfony\Bundle\WebProfilerBundle\WebProfilerBundle();
			$bundles[] = new Sensio\Bundle\DistributionBundle\SensioDistributionBundle();
			$bundles[] = new Sensio\Bundle\GeneratorBundle\SensioGeneratorBundle();
		}

		return $bundles;
	}

	public function registerContainerConfiguration(LoaderInterface $loader)
	{
		$loader->load(__DIR__.'/config/config_'.$this->getEnvironment().'.yml');
	}
}
