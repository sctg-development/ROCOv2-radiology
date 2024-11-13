# ROCOv2: Radiology Object in COntext version 2

## TL;DR
Ready to use ROCOv2 with Transformers in our Hugging Face repository.  

```python
from datasets import load_dataset

ds = load_dataset("eltorio/ROCOv2-radiology")
```

## Introduction

ROCOv2 is a multimodal dataset consisting of radiological images and associated medical concepts and captions extracted from the PMC Open Access Subset. It is an updated version of the ROCO dataset, adding 35,705 new images and improving concept extraction and filtering.

## Dataset Overview

The ROCOv2 dataset contains 79,789 radiological images, each with a corresponding caption and medical concepts. The images are sourced from openly available publications in the PMC Open Access Subset, licensed under CC BY or CC BY-NC.

### Dataset Statistics

* 79,789 radiological images
* 59,958 images in the training set
* 9,904 images in the validation set
* 9,927 images in the test set
* 1,947 unique CUIs overall
* 1,947 CUIs in the training set
* 1,760 CUIs in the validation set
* 1,754 CUIs in the test set

## Dataset Creation

The dataset was created by downloading the full PMC Open Access Subset via FTP, extracting the images and captions, and filtering the images using two binary classification models. The models achieved accuracies of about 90% and 98.6%, respectively.

### Filtering Steps

1. Non-compound image filtering: removed 15,315,657 images
2. Radiological image filtering: removed 64,831 images
3. License filtering: removed 10,392 images from papers not licensed under CC BY or CC BY-NC
4. Duplicate removal: removed 2,056 duplicates
5. Caption filtering: removed 1,528 images with non-English captions and very short captions without relevant information

## Transformers Dataset generation

The dataset hosted in Hugging Face hub was generated with this [notebook](https://colab.research.google.com/#fileId=https://huggingface.co/datasets/eltorio/ROCOv2-radiology/blob/main/generate.ipynb)  
All the source images and code can be found on our [GitHub repo](https://github.com/sctg-development/ROCOv2-radiology)

## Dataset Labels and Concepts

The dataset labels and concepts were generated using the Medical Concept Annotation Toolkit v1.10.0 (MedCAT) and manually curated concepts for modality (all images), body region (X-ray only), and directionality (X-ray only).

### Labeling and Concept Generation Workflow

The labeling and concept generation workflow consisted of the following steps:

1. Image caption extraction
2. Concept extraction using MedCAT
3. Manual curation of concepts for modality, body region, and directionality
4. Combination of automatically generated and manually curated concepts

## Use Cases

The ROCOv2 dataset can be used for various applications, including:

* Training image annotation models based on image-caption pairs
* Multi-label image classification using UMLS concepts
* Pre-training of medical domain models
* Evaluation of deep learning models for multi-task learning
* Image retrieval and caption generation tasks

## Citation

If you use the ROCOv2 dataset in your research, please cite the following paper:

Pelka, O., Menze, B. H., & Rexhausen, S. E. (2023). Radiology Objects in COntext version 2 (ROCOv2): A multimodal dataset for medical image analysis. 
arXiv preprint arXiv:2405.10004.

```latex
@misc {ronan_l.m._2024,
	author       = { {Ronan L.M.} },
	title        = { ROCOv2-radiology (Revision 5d66908) },
	year         = 2024,
	url          = { https://huggingface.co/datasets/eltorio/ROCOv2-radiology },
	doi          = { 10.57967/hf/3489 },
	publisher    = { Hugging Face }
}
```
## License

The ROCOv2 dataset is licensed under the CC BY-NC-SA 4.0 license.

## Acknowledgments

We acknowledge the National Library of Medicine (NLM) for providing access to the PMC Open Access Subset. We also acknowledge the creators of the Medical Concept Annotation Toolkit (MedCAT) for providing a valuable tool for concept extraction and annotation.
