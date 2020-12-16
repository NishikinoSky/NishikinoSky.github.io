---
layout: post
title: Data Structure based on C
tags: DataStructure
stickie: false
---

数据结构期末复习

# Chapter 4  Tree

一个前驱，多个后继

## Degree

degree of a node: the number of subtrees of the node

degree of a tree: max{degree(node)}

parent | children | siblings | leaf(terminal node)

## Path

path from n1 to nk

length of a path: number of edges on the path

depth of ni: length of the unique path from root to ni and depth(root) = 0

height of ni: length of the longest path from ni to a leaf

ancestors of a node: all the nodes along the path from the node up to the root

descendants of a node: all the nodes in its subtrees

## Implementation

List

    {

        element;
    
        pointer to first child;
    
        pointer to next sibling;
    
    }

## Binary Tree

### Traversal

    void  preorder ( tree_ptr  tree ){ 
    
        if  ( tree )  {
        
        visit ( tree );
        
        for (each child C of tree ) preorder ( C );
        
            }
            
    }


    void  postorder ( tree_ptr  tree ){ 
    
        if  ( tree )   {
        
        for (each child C of tree ) postorder ( C );
        
        visit ( tree );
        
        }
        
    }


    void  levelorder ( tree_ptr  tree ){   
    
        enqueue ( tree );
        
        while (queue is not empty) {
        
            visit ( T = dequeue ( ) );
            
            for (each child C of T )enqueue ( C );
            
        }
        
    }
    
    
    void  inorder ( tree_ptr  tree ){  
    
        if  ( tree )   {
        
        inorder ( tree->Left );
        
        visit ( tree->Element );
        
        inorder ( tree->Right );
        
        }
        
    }    


### Binary Search Tree

    Position  Find( ElementType X,  SearchTree T ) { 
    
        if ( T == NULL ) return  NULL;  /* not found in an empty tree */
        
        if ( X < T->Element )  /* if smaller than root */
        
            return  Find( X, T->Left );  /* search left subtree */
            
        else if ( X > T->Element )  /* if larger than root */
        
            return  Find( X, T->Right );  /* search right subtree */
            
        else   /* if X == root */
        
            return  T;  /* found */
    }
    
    T( N ) = S ( N ) =O( d )  where d is the depth of X


     Position  FindMin( SearchTree T ) { 
     
        if ( T == NULL )   return  NULL; /* not found in an empty tree */
        
        else if ( T->Left == NULL )   return  T;  /* found left most */
        
        else   return  FindMin( T->Left );   /* keep moving to left */
        
    }
    
    
        Position  FindMax( SearchTree T ) { 
        
            if ( T != NULL ) 
            
                while ( T->Right != NULL ) 
                
                    T = T->Right;   /* keep moving to find right most */
                    
            return T;  /* return NULL or the right most */
            
    }

Insert

    SearchTree  Insert( ElementType X, SearchTree T ) { 
    
        if ( T == NULL ) { /* Create and return a one-node tree */
        
            T = malloc( sizeof( struct TreeNode ) ); 
            
            if ( T == NULL ) FatalError( "Out of space!!!" ); 
            
            else { T->Element = X; T->Left = T->Right = NULL; }
            
                }  /* End creating a one-node tree */
                
        else/* If there is a tree */
        
            if ( X < T->Element ) 
            
                T->Left = Insert( X, T->Left ); 
                
        else
        
            if ( X > T->Element ) 
            
                T->Right = Insert( X, T->Right ); 
                
                /* Else X is in the tree already; we'll do nothing */
                
        return  T;   
        
        /* Do not forget this line!! */
        
    }
    
Delete

    SearchTree  Delete( ElementType X, SearchTree T ) {    
    
        Position  TmpCell; 
        
        if ( T == NULL )   Error( "Element not found" ); 
        
        else  if ( X < T->Element )  /* Go left */
        
            T->Left = Delete( X, T->Left );
            
        else  if ( X > T->Element )  /* Go right */
        
            T->Right = Delete( X, T->Right ); 
            
        else/* Found element to be deleted */
        
            if ( T->Left && T->Right ) {  /* Two children */
            
                    /* Replace with smallest in right subtree */
                    
                TmpCell = FindMin( T->Right );
                
                T->Element = TmpCell->Element;
                
                T->Right = Delete( T->Element, T->Right );  } /* End if */
                
            else {  /* One or zero child */
            
                    TmpCell = T; 
                    
                    if ( T->Left == NULL ) /* Also handles 0 child */
                    
                            T = T->Right; 
                            
                    else  if ( T->Right == NULL )  T = T->Left;
                    
                    free( TmpCell );  }  /* End else 1 or 0 child */
                    
        return  T;
        
    }
    
    T( N ) = O ( h )  where h is the height of the tree

