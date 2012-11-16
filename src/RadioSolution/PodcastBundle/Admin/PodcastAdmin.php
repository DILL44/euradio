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
  protected function configureFormFields(FormMapper $formMapper)
  {
    $formMapper
      ->add('name')
      ->add('real_time_start')
      ->with('file')
      ->add('filePodcast', 'sonata_type_model', array(), array('edit' => 'list'))
      ->end()
    ;
  }
 
  protected function configureDatagridFilters(DatagridMapper $datagridMapper)
  {
    $datagridMapper
      ->add('name')
    ;
  }
 
  protected function configureListFields(ListMapper $listMapper)
  {
    $listMapper
      ->addIdentifier('name')
      ->add('real_time_start')
      ->add('filePodcast')
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