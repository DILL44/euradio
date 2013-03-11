<?php
namespace Application\Sonata\NewsBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Symfony\Component\HttpFoundation\Request;


class BlockController extends Controller
{
	public function FivePostAction()
	{
		$domain = $this->get('request')->server->get('HTTP_HOST');
		$em = $this->getDoctrine()->getEntityManager();
		$query = $em->createQuery('SELECT p FROM ApplicationSonataNewsBundle:Post p ORDER BY p.publicationDateStart DESC')->setMaxResults(5);
		$posts = $query->getResult();
	
		return $this->render('ApplicationSonataNewsBundle:Block:five_last_post.html.twig', array(
				'posts'  => $posts,
				'domain' => $domain,
		));
	}
	
	public function FiveTagAction()
	{
		$domain = $this->get('request')->server->get('HTTP_HOST');
		$em = $this->getDoctrine()->getEntityManager();
		$query = $em->createQuery('SELECT p FROM ApplicationSonataNewsBundle:Tag p ORDER BY p.updatedAt DESC')->setMaxResults(5);
		$posts = $query->getResult();
	
		return $this->render('ApplicationSonataNewsBundle:Block:five_last_tag.html.twig', array(
				'posts'  => $posts,
				'domain' => $domain,
		));
	}
	public function otherCategoriesAction(Request $request)
	{ 
		//echo("VAR:".$this->get('request')->get('year'));
		//$currentCategorySlug = $request->getPathInfo();

		//echo "currentCategorySlug:".implode('/', $currentCategorySlug);
		
		//$request = Request::create('/hello-world', 'GET', array('name' => 'Fabien'));
		
		$path = $request->getPathInfo();
		
		$pathArray = explode('/', $path);

		$currentCategorySlug = $pathArray[count($pathArray)-1];
		
		//echo $currentCategorySlug;
		
		$em = $this->getDoctrine()->getEntityManager();		
		
		if($currentCategorySlug){
			
			$currentCategory = $this->get('sonata.news.manager.category')->findOneBy(array(
					'slug' => $currentCategorySlug,
					'enabled' => true
			));
	
		}
		
		if(isset($currentCategory)){
			$query = $em->createQuery('SELECT p FROM ApplicationSonataNewsBundle:Category p WHERE p.id!= :category ORDER BY p.updatedAt DESC')->setParameter('category', $currentCategory->getId());
		}else{
			$query = $em->createQuery('SELECT p FROM ApplicationSonataNewsBundle:Category p ORDER BY p.updatedAt DESC');
			$currentCategory = null;
		}
		
		$categories = $query->getResult();
		
		return $this->render('ApplicationSonataNewsBundle:Block:other_categories.html.twig', array(
				'categories'  => $categories,
				'currentCategory' => $currentCategory,
		));
	}
	
	public function lastsPostsAction(Request $request)
	{
	
		
		$path = $request->getPathInfo();
		
		$pathArray = explode('/', $path);
		
		$em = $this->getDoctrine()->getEntityManager();
		
		if($pathArray[1] == 'blog'){
			
			$permalink = $pathArray[2].'/'.$pathArray[3].'/'.$pathArray[4].'/'.$pathArray[5];
			
			$date = \DateTime::createFromFormat('Y/n/j', $pathArray[2].'/'.$pathArray[3].'/'.$pathArray[4]);
			
			$dateNext = \DateTime::createFromFormat('Y/n/j', $pathArray[2].'/'.$pathArray[3].'/'.($pathArray[4]+1));
			
			//$post = $this->getPostManager()->findOneByPermalink($permalink, $this->container->get('sonata.news.blog'));
			
			$query = $em->createQuery("SELECT p FROM ApplicationSonataNewsBundle:Post p 
											WHERE p.slug='".$pathArray[5]."' 
												AND p.publicationDateStart>'".$date->format("Y-m-d 00:00:00")."' 
												AND p.publicationDateStart<'".$date->format("Y-m-d 23:59:59")."' 
													ORDER BY p.publicationDateStart DESC")->setMaxResults(1);
	
			$posts = $query->getResult();
			
			if(count($posts) == 1){
				
				$currentPost = $posts[0];
				
				if($currentPost->getCategory()){
					
					$category = $currentPost->getCategory();
					$categoryId = $category->getId();
					$categoryName = $category->getName();
					
				}else{
					
					$category = null;
				}
				
				if($currentPost->getPodcast()){
				
					$emission = $currentPost->getPodcast()->getEmission();
					
					$query = $em->createQuery("SELECT e FROM ProgramBundle:Emission e WHERE e.name=:emission")
					->setParameter('emission', $emission)
					->setMaxResults(1);
					$emissions = $query->getResult();
					
					if(count($emissions) == 1){
						
						$emission = $emissions[0];
						
					}else{
						
						$emission = null;
					}
					
				}else{
					
					$emission = null;
					
				}
				
			}else{
				
				$category = null;
				$emission = null;
			}
			
		}else{
			
			$category = null;
			$emission = null;
			
		}

		if($category){
	
			if($emission === null){			
				$limit = 4;
			}else{
				$limit = 2;	
			}
			
			$query = $em->createQuery('SELECT p FROM ApplicationSonataNewsBundle:Post p
				WHERE p.category=:category AND p.id!=:post ORDER BY p.publicationDateStart DESC')
				->setParameter('category', $category)
				->setParameter('post', $currentPost)
				->setMaxResults($limit);

			$catPosts = $query->getResult();			
			
		}else{
			
			$catPosts = null;
		}
		
		if($emission){
	
			if($category === null){
				$limit = 4;
			}else{
				$limit = 2;
			}
				
			
			$query = $em->createQuery("SELECT p
				FROM ApplicationSonataNewsBundle:Post p, PodcastBundle:Podcast po, ProgramBundle:Program pr
					WHERE p.id = po.post AND po.id=pr.podcast AND pr.emission=:emission AND p.id!=:post
						ORDER BY p.publicationDateStart DESC")
						->setParameter('emission', $emission)
						->setParameter('post', $currentPost)
						->setMaxResults($limit);
			$emiPosts = $query->getResult();

		}else{
			
			$emiPosts = null;
		}
		
		if(!$category && !$emission && isset($currentPost)){
		
			$query = $em->createQuery('SELECT p FROM ApplicationSonataNewsBundle:Post p
										WHERE p.id!=:post
											ORDER BY p.publicationDateStart DESC')
				->setParameter('post', $currentPost)
				->setMaxResults(4);
			
			$posts = $query->getResult();
		
		}elseif(!$category && !$emission){
		
			$query = $em->createQuery('SELECT p FROM ApplicationSonataNewsBundle:Post p
											ORDER BY p.publicationDateStart DESC')
				->setMaxResults(4);
		
			$posts = $query->getResult();
			
		}else{
			
			$posts = null;
			
		}
		
	
		return $this->render('ApplicationSonataNewsBundle:Block:lasts_posts.html.twig', array(
				'posts'  	=> $posts,
				'catPosts'	=> $catPosts,
				'category' 	=> $category,
				'emiPosts'	=> $emiPosts,
				'emission' 	=> $emission
		));
	
	}	

}