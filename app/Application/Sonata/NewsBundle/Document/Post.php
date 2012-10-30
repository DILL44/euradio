<?php
/**
 * This file is part of the <name> project.
 *
 * (c) <yourname> <youremail>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Application\Sonata\NewsBundle\Document;

use Sonata\NewsBundle\Document\BasePost as BasePost;

/**
 * This file has been generated by the EasyExtends bundle ( http://sonata-project.org/easy-extends )
 *
 * References :
 *   working with object : http://www.doctrine-project.org/docs/mongodb_odm/1.0/en/reference/working-with-objects.html
 *
 * @author <yourname> <youremail>
 */
class Post extends BasePost
{

    /**
     * @var integer $id
     */
    protected $id;
    
    /**
     * @var podcast $postcast
     */
    protected $podcast;
    
    /**
     * Get id
     *
     * @return integer $id
     */
    public function getId()
    {
      return $this->id;
    }
     /**
     * Get podcast
     *
     * @return Podcast $podcast
     */
    public function getPodcast()
    {
    	return $this->podcast;
    }   
     /**
     * Get podcast
     *
     * @return Podcast $podcast
     */
    public function setPodcast(\RadioSolution\PodcastBundle\Podcast $podcast)
    {
    	$this->podcast=$podcast;
    } 

}