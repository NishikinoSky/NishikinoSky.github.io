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

    element
    
    pointer to first child
    
    pointer to next sibling
    
    }




