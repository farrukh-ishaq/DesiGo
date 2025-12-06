import { Suspense } from "react"
import SkeletonProductGrid from "@modules/skeletons/templates/skeleton-product-grid"
import RefinementList from "@modules/store/components/refinement-list"
import PaginatedProducts from "./paginated-products"
import { SortOptions } from "@modules/store/components/refinement-list/sort-products"

const StoreTemplate = ({
                         countryCode,
                         sortBy,
                         page,
                         searchQuery,
                       }: {
  countryCode: string
  sortBy?: SortOptions
  page?: string
  searchQuery?: string
}) => {
  const sort = sortBy || "created_at"
  const pageNumber = page ? parseInt(page) : 1

  return (
    <div className="flex flex-col small:flex-row small:items-start py-6 content-container">
      {/* Client-side refinement & search */}
      <RefinementList sortBy={sort} />

      <div className="w-full">
        <div className="mb-8 text-2xl-semi">
          <h1>{searchQuery ? `Results for "${searchQuery}"` : "All products"}</h1>
        </div>

        <Suspense fallback={<SkeletonProductGrid />}>
          <PaginatedProducts
            countryCode={countryCode}
            sortBy={sort}
            page={pageNumber}
            searchQuery={searchQuery}
          />
        </Suspense>
      </div>
    </div>
  )
}

export default StoreTemplate
