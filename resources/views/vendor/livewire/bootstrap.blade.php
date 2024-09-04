@php
  if (!isset($scrollTo)) {
      $scrollTo = 'body';
  }

  $scrollIntoViewJsSnippet = ($scrollTo !== false)
    ? <<<JS
       (\$el.closest('{$scrollTo}') || document.querySelector('{$scrollTo}')).scrollIntoView()
    JS
    : '';
@endphp

@if ($paginator->hasPages())
  <div class="pagination-wrap text-center">
    <ul>
      {{-- Previous Page Link --}}
      @if ($paginator->onFirstPage())
        <li style="pointer-events: none;" aria-disabled="true" aria-label="@lang('pagination.previous')">
          <a aria-hidden="true">Prev</a>
        </li>
      @else
        <li>
          <a type="button"
            dusk="previousPage{{ $paginator->getPageName() == 'page' ? '' : '.' . $paginator->getPageName() }}"
            wire:click="previousPage('{{ $paginator->getPageName() }}')" x-on:click="{{ $scrollIntoViewJsSnippet }}"
            wire:loading.attr="disabled" aria-label="@lang('pagination.previous')">Prev</a>
        </li>
      @endif

      {{-- Pagination Elements --}}
      @foreach ($elements as $element)
        {{-- "Three Dots" Separator --}}
        @if (is_string($element))
          <li style="pointer-events: none;" aria-disabled="true"><span>{{ $element }}</span>
          </li>
        @endif

        {{-- Array Of Links --}}
        @if (is_array($element))
          @foreach ($element as $page => $url)
            @if ($page == $paginator->currentPage())
              <li wire:key="paginator-{{ $paginator->getPageName() }}-page-{{ $page }}"
                aria-current="page">
                <a class="active">{{ $page }}</a>
              </li>
            @else
              <li wire:key="paginator-{{ $paginator->getPageName() }}-page-{{ $page }}"><a type="button"
                  wire:click="gotoPage({{ $page }}, '{{ $paginator->getPageName() }}')"
                  x-on:click="{{ $scrollIntoViewJsSnippet }}">{{ $page }}</a></li>
            @endif
          @endforeach
        @endif
      @endforeach

      {{-- Next Page Link --}}
      @if ($paginator->hasMorePages())
        <li>
          <a type="button"
            dusk="nextPage{{ $paginator->getPageName() == 'page' ? '' : '.' . $paginator->getPageName() }}"
            wire:click="nextPage('{{ $paginator->getPageName() }}')" x-on:click="{{ $scrollIntoViewJsSnippet }}"
            wire:loading.attr="disabled" aria-label="@lang('pagination.next')">Next</a>
        </li>
      @else
        <li class="page-item disabled" aria-disabled="true" aria-label="@lang('pagination.next')">
          <a aria-hidden="true">Next</a>
        </li>
      @endif
    </ul>

    <div class="mt-3">
      <p class="small text-muted">
        {!! __('Showing') !!}
        <span class="fw-semibold">{{ $paginator->firstItem() }}</span>
        {!! __('to') !!}
        <span class="fw-semibold">{{ $paginator->lastItem() }}</span>
        {!! __('of') !!}
        <span class="fw-semibold">{{ $paginator->total() }}</span>
        {!! __('results') !!}
      </p>
    </div>
  </div>
@endif
