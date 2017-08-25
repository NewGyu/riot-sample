<lv1-tab>
  <div class="tabs is-boxed is-fullwidth">
    <ul>
      <li each={ tab, i in opts.tabs } class={ is-active: tab.caption == parent.opts.active }>
        <a href={ tab.link }>
          <span>{ tab.caption }</span>
        </a>
      </li>
    </ul>
  </div>
</lv1-tab>