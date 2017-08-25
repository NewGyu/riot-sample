<lv2-tab>
  <div class="tabs is-toggle is-fullwidth">
    <ul>
      <li each={ tab, i in opts.tabs } class={ is-active: tab.caption == parent.opts.active }>
        <a href={ tab.link }>
          <span>{ opts.active }</span>
          <span class="icon is-small"><i class="fa { tab.icon }" /></span>
          <span>{ tab.caption }</span>
        </a>
      </li>
    </ul>
  </div>

  <style>
    .tabs {
      padding-bottom: 2rem;
    }
  </style>

  <script>
  </script>
</lv2-tab>