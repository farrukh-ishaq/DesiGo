import { Metadata } from "next"
import { SortOptions } from "@modules/store/components/refinement-list/sort-products"
import StoreTemplate from "@modules/store/templates"

export const metadata: Metadata = {
  title: "Store",
  description: "Explore all of our products.",
}

type PageProps = {
  params: { countryCode: string }
  searchParams: { sortBy?: SortOptions; page?: string; q?: string }
}

export default function StorePage({ params, searchParams }: PageProps) {
  const countryCode = params.countryCode
  const searchQuery = searchParams.q
  return (
    <StoreTemplate
      countryCode={countryCode}
      sortBy={searchParams.sortBy}
      page={searchParams.page}
      searchQuery={searchQuery}
    />
  )
}
