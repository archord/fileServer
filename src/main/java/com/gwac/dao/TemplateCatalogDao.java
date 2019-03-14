/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gwac.dao;

import com.gwac.model.TemplateCatalog;

/**
 *
 * @author msw
 */
public interface TemplateCatalogDao extends BaseHibernateDao<TemplateCatalog> {
  public String findRecord(int start, int length);
  public Boolean exist(TemplateCatalog obj);
}
