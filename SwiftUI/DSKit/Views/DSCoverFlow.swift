//
//  DSCoverFlow.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI

public struct DSCoverFlow<Data, ID, Content>: View where Data: RandomAccessCollection, ID: Hashable, Data.Element: Equatable, Content: View {
    
    @Environment(\.appearance) var appearance: DSAppearance
    let height: DSSpacingDimension
    let spacing: DSSpacingDimension
    let showPaginationView: Bool
    
    let data: Data
    let content: (Data.Element) -> Content
    let id: KeyPath<Data.Element, ID>
    
    @State private var currentElementID: Data.Element
    
    public init(
        height: DSSpacingDimension,
        spacing: DSSpacingDimension = .regular,
        showPaginationView: Bool = true,
        data: Data,
        id: KeyPath<Data.Element, ID>,
        @ViewBuilder content: @escaping (Data.Element) -> Content
    ) {
        self.height = height
        self.spacing = spacing
        self.showPaginationView = showPaginationView
        self.data = data
        self.id = id
        self.content = content
        _currentElementID = State(initialValue: data.first!)
    }
    
    public var body: some View {
        DSVStack(alignment: .center, spacing: .zero) {
            GeometryReader { p in
                DSPaginatedScrollView(
                    pageWidth: p.size.width,
                    interItemSpacing: appearance.size.number(for: spacing),
                    data: data,
                    id: id,
                    currentPage: $currentElementID
                ) { element in
                    content(element)
                }
            }
            if showPaginationView {
                defaultPaginationIndicator()
                    .dsPadding(.top)
            }
        }.dsHeight(height)
    }
    
    private func defaultPaginationIndicator() -> some View {
        DSHStack {
            ForEach(data, id: id) { element in
                Circle()
                    .fill(Color(uiColor: appearance.primaryView.text.headline))
                    .dsSize(7)
                    .opacity(currentElementID == element ? 1 : 0.1)
            }
        }.dsHeight(.regular)
    }
}

struct DSCoverFlow_Previews: PreviewProvider {
    static var previews: some View {
        let colors = [Color.red, Color.green, Color.yellow]
        PreviewForEach { DSPreview {
                DSCoverFlow(height: 200, spacing: .medium, data: colors, id: \.self) { color in
                    color
                }
                .dsLayoutGuideLines(divider: 1)
            }.dsScreen()
        }
    }
}

fileprivate struct DSPaginatedScrollView<Data, ID, Content>: UIViewRepresentable where Data: RandomAccessCollection, Data.Element: Equatable, ID: Hashable, Content: View {
    
    let data: Data
    let content: (Data.Element) -> Content
    let id: KeyPath<Data.Element, ID>
    @Binding var currentPage: Data.Element
    let interItemSpacing: CGFloat
    let pageWidth: CGFloat
    
    init(
        pageWidth: CGFloat,
        interItemSpacing: CGFloat,
        data: Data,
        id: KeyPath<Data.Element, ID>,
        currentPage: Binding<Data.Element>,
        @ViewBuilder content: @escaping (Data.Element) -> Content
    ) {
        self.data = data
        self.content = content
        self.id = id
        self.interItemSpacing = interItemSpacing
        self.pageWidth = pageWidth
        self._currentPage = currentPage
    }
    
    typealias UIViewType = UIScrollView
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        setupScrollView(scrollView, context: context)
        addContentView(to: scrollView)
        return scrollView
    }

    private func setupScrollView(_ scrollView: UIScrollView, context: Context) {
        scrollView.isPagingEnabled = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.clipsToBounds = false
        scrollView.delegate = context.coordinator
        scrollView.decelerationRate = .fast
        scrollView.backgroundColor = .clear
    }

    private func addContentView(to scrollView: UIScrollView) {
        let contentView = createContentView()
        contentView.view.backgroundColor = .clear
        contentView.view.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView.view)
        
        NSLayoutConstraint.activate([
            contentView.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.view.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.view.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }

    private func createContentView() -> UIHostingController<AnyView> {
        let hostedContent = HStack(spacing: interItemSpacing) {
            ForEach(data, id: id) { element in
                content(element).frame(width: pageWidth)
            }
        }
        return UIHostingController(rootView: AnyView(hostedContent))
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        // Update the view if needed
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        var parent: DSPaginatedScrollView
        
        init(parent: DSPaginatedScrollView) {
            self.parent = parent
        }
        
        func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
            let maxIndex = CGFloat(parent.data.count)
            let targetIndex = calculateTargetIndex(scrollView: scrollView, velocity: velocity, maxIndex: maxIndex)
            let targetOffset = calculateTargetOffset(scrollView: scrollView, targetIndex: targetIndex)
            targetContentOffset.pointee.x = targetOffset
            setDecelerationRate(for: scrollView)
            setCurrentPage(for: Int(targetIndex))
        }

        private func calculateTargetIndex(scrollView: UIScrollView, velocity: CGPoint, maxIndex: CGFloat) -> CGFloat {
            let pageWidth = parent.pageWidth
            let interItemSpacing = parent.interItemSpacing
            let targetX = scrollView.contentOffset.x + velocity.x * 60.0
            var targetIndex: CGFloat = 0.0
            
            if velocity.x > 0 {
                targetIndex = ceil(targetX / (pageWidth + interItemSpacing))
            } else if velocity.x == 0 {
                targetIndex = round(targetX / (pageWidth + interItemSpacing))
            } else if velocity.x < 0 {
                targetIndex = floor(targetX / (pageWidth + interItemSpacing))
            }
            
            return min(max(targetIndex, 0), maxIndex)
        }

        private func calculateTargetOffset(scrollView: UIScrollView, targetIndex: CGFloat) -> CGFloat {
            let pageWidth = parent.pageWidth
            let interItemSpacing = parent.interItemSpacing
            return targetIndex * (pageWidth + interItemSpacing)
        }

        private func setDecelerationRate(for scrollView: UIScrollView) {
            scrollView.decelerationRate = .fast
        }
        
        private func setCurrentPage(for index: Int) {
            let index = parent.data.index(parent.data.startIndex, offsetBy: index)
            if index >= parent.data.startIndex && index < parent.data.endIndex {
                self.parent.currentPage = self.parent.data[index]
            }
        }
    }
}
