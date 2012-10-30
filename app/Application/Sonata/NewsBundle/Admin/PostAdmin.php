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
            ->end()
            ->with('podcast')
            	->add('podcast','sonata_type_model', array('required' => false))
            ->end()
            ->with('Tags')
                ->add('tags', 'sonata_type_model', array('expanded' => true))
            ->end()
            ->with('Options')
                ->add('publicationDateStart')
                ->add('commentsCloseAt')
                ->add('commentsEnabled', null, array('required' => false))
                ->add('commentsDefaultStatus', 'choice', array('choices' => Comment::getStatusList(), 'expanded' => true))
            ->end()
        ;
    }
}
