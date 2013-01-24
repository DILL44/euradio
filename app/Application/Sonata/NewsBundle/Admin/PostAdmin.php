<?php

/*
 * This file is part of the Sonata package.
 *
 * (c) Thomas Rabaix <thomas.rabaix@sonata-project.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */



namespace Application\Sonata\NewsBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Show\ShowMapper;
use Sonata\FormatterBundle\Formatter\Pool as FormatterPool;
use Sonata\NewsBundle\Admin\PostAdmin as BaseAdmin;


use Knp\Menu\ItemInterface as MenuItemInterface;

use Application\Sonata\NewsBundle\Entity\Comment;

class PostAdmin extends BaseAdmin
{
	
    protected $datagridValues = array(
        '_sort_order' => 'DESC', // sort direction
        '_sort_by' => 'publication_date_start' // field name
    );
    /**
     * {@inheritdoc}
     */
    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
            ->with('General')
                ->add('enabled', null, array('required' => false))
                ->add('author', 'sonata_type_model', array(), array('edit' => 'list'))
                ->add('category', 'sonata_type_model', array(), array('edit' => 'list'))
                ->add('title')
                ->add('abstract')
                ->add('contentFormatter', 'sonata_formatter_type_selector', array(
                    'source' => 'rawContent',
                    'target' => 'content'
                ))
                ->add('rawContent','textarea', array('attr' => array('class' => 'tinymce', 'tinymce'=>'{"theme":"medium"}')))
                ->add('image','sonata_type_model',array('required' => false),array('edit' => 'list','link_parameters' => array('provider'=>'sonata.media.provider.image')))
            ->end()
            ->with('Tags')
                ->add('tags', 'sonata_type_model', array('expanded' => true,'required' => false))
            ->end()
            ->with('Options')
                ->add('publicationDateStart')
                ->add('commentsCloseAt')
                ->add('commentsEnabled', null, array('required' => false))
                ->add('commentsDefaultStatus', 'choice', array('choices' => Comment::getStatusList(), 'expanded' => true))
            ->end()
        ;
    }
    protected function configureSideMenu(MenuItemInterface $menu, $action, Admin $childAdmin = null)
    {}
    
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
    	$datagridMapper
    	->add('title')
    	->add('author')
    	;
    }
    
    protected function configureListFields(ListMapper $listMapper)
    {
    	$listMapper
    	->addIdentifier('title')
    	->add('author')
    	->add('category')
    	->add('enabled')
    	->add('commentsEnabled')
    	->add('PublicationDateStart', 'date', array('template' => 'SonataNewsBundle:PostAdmin:list_date_custom.html.twig'))
    	;
    }
    
    
    
}
