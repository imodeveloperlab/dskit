//
//  WebDocuments.swift
//  DSKit
//
//  Created by Borinschi Ivan on 05.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation
import UIKit

class DocumentsGroups {
    
    func page() -> DocumentsGroup {
        
        var documents = [Documentable]()
        documents.append(PageSimplePageVC())
        
        return DocumentsGroup(title: "Pages", documents: documents)
    }
    
    func content() -> DocumentsGroup {
        
        var documents = [Documentable]()
        documents.append(ShowContentVC())
        documents.append(ShowBottomContentVC())
        documents.append(ShowTopContentVC())
        documents.append(ShowTopBottomContentVC())
        
        return DocumentsGroup(title: "Show Content", documents: documents)
    }
    
    func style() -> DocumentsGroup {
        
        var documents = [Documentable]()
        documents.append(StyleVC())
        
        return DocumentsGroup(title: "Style", documents: documents)
    }
    
    func typography() -> DocumentsGroup {
        
        var documents = [Documentable]()
        documents.append(TypographyTextTypesVC())
        documents.append(TypographyTextListVC())
        documents.append(TypographyTextGridVC())
        documents.append(TypographyTextGalleryVC())
        documents.append(TypographyTextComposerTextVC())
        documents.append(TypographyTextComposerActionVC())
        documents.append(TypographyActiveTextVC())
        
        return DocumentsGroup(title: "Text", documents: documents)
    }
    
    func lists() -> DocumentsGroup {
        
        var documents = [Documentable]()
        documents.append(ListSimpleLayoutVC())
        documents.append(ListSeparatorLayoutVC())
        documents.append(ListGroupedLayoutVC())
        documents.append(ListGroupedAndSeparatorLayoutVC())
        documents.append(ListGroupedSeparatorHeaderFooterLayoutVC())
        documents.append(ListWithSupplementaryItemsLayoutVC())
        documents.append(ListWithAdditionalViewModelsLayoutVC())
        
        return DocumentsGroup(title: "Lists", documents: documents)
    }
    
    func grids() -> DocumentsGroup {
        
        var documents = [Documentable]()
        documents.append(GridSimpleLayoutVC())
        documents.append(GridSimpleHeaderFooterLayoutVC())
        documents.append(GridGrouped3RowsLayoutVC())
        documents.append(GridGrouped5RowsHeaderFooterLayoutVC())
        documents.append(GridWithSupplementaryItemsLayoutVC())

        return DocumentsGroup(title: "Grids", documents: documents)
    }
    
    func gallery() -> DocumentsGroup {
        
        var documents = [Documentable]()
        documents.append(GalleryAbsoluteWidthLayoutVC())
        documents.append(GalleryFractionalWidthLayoutVC())
        documents.append(GalleryFractional1GroupedLayoutVC())
        documents.append(GalleryFractional1LayoutVC())
        documents.append(GalleryFullWidthLayoutVC())
        documents.append(GalleryPageControlFractional1LayoutVC())
        documents.append(GalleryPageControlLayoutVC())
        documents.append(GalleryWithSupplementaryItemsLayoutVC())
        
        
        
        return DocumentsGroup(title: "Gallery", documents: documents)
    }
    
    func actions() -> DocumentsGroup {
        
        var documents = [Documentable]()
        documents.append(ActionGroupedListVC())
        documents.append(ActionListVC())
        documents.append(ActionGridVC())
        documents.append(ActionGalleryVC())
        documents.append(ActionLeftIconVC())
        documents.append(ActionTopImageVC())
        documents.append(ActionLeftRoundImageVC())
        documents.append(ActionLeftRoundImageSizeVC())
        documents.append(ActionLeftImageVC())
        documents.append(ActionRightRoundImageVC())
        documents.append(ActionRightIconVC())
        documents.append(ActionRightRoundImageSizeVC())
        documents.append(ActionRightImageVC())
        documents.append(ActionRightButtonVC())
        return DocumentsGroup(title: "Actions", documents: documents)
    }
    
    func buttons() -> DocumentsGroup {
        
        var documents = [Documentable]()
        documents.append(ButtonsVC())
        documents.append(ButtonGridVC())
        documents.append(ButtonListVC())
        documents.append(ButtonGalleryVC())
        return DocumentsGroup(title: "Buttons", documents: documents)
    }
    
    func images() -> DocumentsGroup {
        
        var documents = [Documentable]()
        documents.append(ImagesVC())
        documents.append(ImageListVC())
        documents.append(ImageGridVC())
        documents.append(ImageGalleryVC())
        documents.append(ImageGalleryHandleDidTapVC())
        
        return DocumentsGroup(title: "Images", documents: documents)
    }
    
    func texfields() -> DocumentsGroup {
        
        var documents = [Documentable]()
        documents.append(TextFieldsVC())
        documents.append(TextFieldValidDataVC())
        documents.append(TextFieldInvalidDataVC())
        documents.append(TextFieldCustomValidationVC())
        documents.append(TextFieldCustomInvalidPlaceHolderMessageVC())
        documents.append(TextFieldBuiltInValidationVC())
        documents.append(TextFieldShortcutsVC())
        documents.append(TextFieldsGroupedVC())
        documents.append(TextFieldIconsVC())
        documents.append(TextFieldsGridVC())
        documents.append(TextFieldsGroupedGridVC())
        return DocumentsGroup(title: "Text fields", documents: documents)
    }
    
    func other() -> DocumentsGroup {
        
        var documents = [Documentable]()
        documents.append(MapViewController())
        documents.append(CardViewController())
        documents.append(SegmentViewController())
        documents.append(PageControlViewController())
        return DocumentsGroup(title: "Other", documents: documents)
    }
    
    func documentGroups() -> [DocumentsGroup] {
        
        var groups = [DocumentsGroup]()
        groups.append(content())
        groups.append(typography())
        groups.append(lists())
        groups.append(grids())
        groups.append(gallery())
        groups.append(actions())
        groups.append(buttons())
        groups.append(images())
        groups.append(texfields())
        groups.append(page())
        groups.append(other())
        groups.append(style())
        
        return groups
    }
}
