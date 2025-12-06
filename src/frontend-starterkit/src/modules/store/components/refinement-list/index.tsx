"use client"

import { usePathname, useRouter, useSearchParams } from "next/navigation"
import { useCallback, useState } from "react"
import { Input } from "@medusajs/ui"
import SortProducts, { SortOptions } from "./sort-products"

type RefinementListProps = { sortBy: SortOptions }

const RefinementList = ({ sortBy }: RefinementListProps) => {
  const router = useRouter()
  const pathname = usePathname()
  const searchParams = useSearchParams()

  const [search, setSearch] = useState(searchParams.get("q") || "")

  const updateQuery = useCallback(
    (name: string, value: string) => {
      const params = new URLSearchParams(searchParams)
      if (value) params.set(name, value)
      else params.delete(name)
      router.push(`${pathname}?${params.toString()}`)
    },
    [pathname, router, searchParams]
  )

  return (
    <div className="flex flex-col gap-4 py-4 mb-8 small:flex-col small:px-0 small:min-w-[250px] small:ml-[1.675rem]">
      <SortProducts sortBy={sortBy} setQueryParams={updateQuery} />
      <label htmlFor="search-products" className="sr-only">
        Search products
      </label>
      <Input
        type="search"
        id="search-products"
        name="q"
        placeholder="Search products..."
        value={search}
        onChange={(e) => {
          setSearch(e.target.value)
          updateQuery("q", e.target.value)
        }}
        className="h-10 w-full"
      />


    </div>
  )
}

export default RefinementList
