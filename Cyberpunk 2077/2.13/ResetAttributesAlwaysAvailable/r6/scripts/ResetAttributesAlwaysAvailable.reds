@replaceMethod(NewPerksCategoriesGameController)
  private final func ResolveResetAttributesButtonVisibility() -> Void {
    if !IsDefined(this.m_questSystem) {
      inkWidgetRef.SetVisible(this.m_resetAttributesButton, false);
      return;
    };
    if this.m_questSystem.GetFact(n"ResetAttributeDisabled") == 0 {
      inkWidgetRef.SetVisible(this.m_resetAttributesButton, true);
    } else {
      inkWidgetRef.SetVisible(this.m_resetAttributesButton, true);
    };
  }

@replaceMethod(NewPerksCategoriesGameController)
  protected cb func OnResetConfirmed(data: ref<inkGameNotificationData>) -> Bool {
    let resultData: ref<GenericMessageNotificationCloseData> = data as GenericMessageNotificationCloseData;
    this.m_resetConfirmationToken = null;
    if IsDefined(resultData) && Equals(resultData.result, GenericMessageNotificationResult.Yes) {
      PlayerDevelopmentSystem.GetData(this.m_player).ResetNewPerks();
      PlayerDevelopmentSystem.GetData(this.m_player).ResetAttributes();
      this.QueueEvent(new PlayerDevUpdateDataEvent());
      inkWidgetRef.SetVisible(this.m_resetAttributesButton, true);
      this.PlaySound(n"Attributes", n"OnDone");
      this.PlayLibraryAnimation(n"panel_categories_reset_attributes");
    };
  }  

@replaceMethod(NewPerksCategoriesGameController)
  protected cb func OnResetAttributesButtonClick(evt: ref<inkPointerEvent>) -> Bool {
    let result: CanSellNewPerkResult;
    let vendorNotification: ref<UIMenuNotificationEvent>;
    if evt.IsAction(n"click") {
      if this.m_player.IsInCombat() {
        vendorNotification = new UIMenuNotificationEvent();
        vendorNotification.m_notificationType = UIMenuNotificationType.InventoryActionBlocked;
        this.QueueEvent(vendorNotification);
      } else {
          result = PlayerDevelopmentSystem.CanSellNewPerks(this.m_player);
          if !result.success {
            if Equals(result.message, "UI-Notifications-RespecCyberwareCapacityBlocked") {
              this.OpenPerksScreen(gamedataStatType.TechnicalAbility, NewPerkTabsArrowDirection.Invalid);
              this.m_perksScreenController.SetCursorOverPerk(result.perkType, false);
            };
            this.m_resetConfirmationToken = GenericMessageNotification.Show(this, result.title, result.message, GenericMessageNotificationType.Confirm);
            this.m_resetConfirmationToken.RegisterListener(this, n"OnResetFailed");
            return false;
          };
          this.m_resetConfirmationToken = GenericMessageNotification.Show(this, "UI-Menus-Perks-ResetAttributes", "UI-Menus-Perks-ResetAttributesConfirmation", GenericMessageNotificationType.YesNo);
          this.m_resetConfirmationToken.RegisterListener(this, n"OnResetConfirmed");
        };
      };
    }