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
  <nav class="d-flex flex-column justify-items-center justify-content-center">
    <div class="mx-auto">
      <div class="d-none flex-sm-fill d-sm-flex align-items-sm-center justify-content-sm-between">
        <ul class="pagination">
          {{-- Previous Page Link --}}
          @if ($paginator->onFirstPage())
            <li class="page-item disabled" aria-disabled="true" aria-label="@lang('Previous')">
              <span class="page-link" aria-hidden="true">&lsaquo;</span>
            </li>
          @else
            <li class="page-item">
              <a type="button" class="page-link"
                dusk="previousPage{{ $paginator->getPageName() == 'page' ? '' : '.' . $paginator->getPageName() }}"
                wire:click="previousPage('{{ $paginator->getPageName() }}')" x-on:click="{{ $scrollIntoViewJsSnippet }}"
                wire:loading.attr="disabled" aria-label="@lang('pagination.previous')">
                &lsaquo;
              </a>
            </li>
          @endif

          {{-- Pagination Elements --}}
          @foreach ($elements as $element)
            {{-- "Three Dots" Separator --}}
            @if (is_string($element))
              <li class="page-item disabled" aria-disabled="true">
                <span class="page-link">{{ $element }}</span>
              </li>
            @endif

            {{-- Array Of Links --}}
            @if (is_array($element))
              @foreach ($element as $page => $url)
                @if ($page == $paginator->currentPage())
                  <li wire:key="paginator-{{ $paginator->getPageName() }}-page-{{ $page }}"
                    class="page-item active" aria-current="page">
                    <span class="page-link">{{ $page }}</span>
                  </li>
                @else
                  {{-- <li class="page-item"><a class="page-link" href="{{ $url }}">{{ $page }}</a></li> --}}
                  <li class="page-item" wire:key="paginator-{{ $paginator->getPageName() }}-page-{{ $page }}">
                    <a class="page-link" type="button"
                      wire:click="gotoPage({{ $page }}, '{{ $paginator->getPageName() }}')"
                      x-on:click="{{ $scrollIntoViewJsSnippet }}">{{ $page }}</a>
                  </li>
                @endif
              @endforeach
            @endif
          @endforeach

          {{-- Next Page Link --}}
          @if ($paginator->hasMorePages())
            <li class="page-item">
              <a class="page-link" type="button"
                dusk="nextPage{{ $paginator->getPageName() == 'page' ? '' : '.' . $paginator->getPageName() }}"
                wire:click="nextPage('{{ $paginator->getPageName() }}')" x-on:click="{{ $scrollIntoViewJsSnippet }}"
                wire:loading.attr="disabled" aria-label="@lang('pagination.next')">&rsaquo;</a>
            </li>
          @else
            <li class="page-item disabled" aria-disabled="true" aria-label="@lang('Previous')">
              <span class="page-link" aria-hidden="true">&rsaquo;</span>
            </li>
          @endif
        </ul>
      </div>
    </div>
    <div class="mx-auto">
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
  </nav>

@endif
