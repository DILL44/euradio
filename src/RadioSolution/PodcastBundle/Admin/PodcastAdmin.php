<?php 
namespace RadioSolution\PodcastBundle\Admin;
 
use Application\Sonata\MediaBundle\Entity\Media;
use Sonata\UserBundle\Controller\AdminSecurityController;
use Imagine\Exception\Exception;
use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\AdminBundle\Form\FormMapper;
 
class PodcastAdmin extends Admin
{
	
	// setup the default sort column and order
	protected $datagridValues = array(
			'_sort_order' => 'DESC',
			'_sort_by' => 'real_time_start'
	);
	
  protected function configureFormFields(FormMapper $formMapper)
  {
    $formMapper
      ->add('name')
      ->add('home_page', null,array('required' => false))
      ->add('real_time_start')
      ->with('file')
      ->add('filePodcast', 'sonata_type_model', array('required' => true), array('edit' => 'list','link_parameters' => array('provider'=>'sonata.media.provider.podcast')))
      ->add('dlAuth', null,array('required' => false))
      ->add('post', 'sonata_type_model', array('required' => true), array('edit' => 'list'))
      ->end()
    ;
  }
 
  protected function configureDatagridFilters(DatagridMapper $datagridMapper)
  {
    $datagridMapper
      ->add('name')
      ->add('real_time_start')   
    ;
  }
 
  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
      ->addIdentifier('name')
      ->add('real_time_start')
      ->add('filePodcast')
      ->add('dlAuth')
      ->add('home_page')
    ;
  }
  
  public function validate(ErrorElement $errorElement, $object)
  {	
  	$errorElement
  	->with('name')
  	->assertMaxLength(array('limit' => 32))
  	->end()
  	;
  }
}